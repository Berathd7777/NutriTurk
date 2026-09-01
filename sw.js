// sw.js — NutriTürk Service Worker
// Amaç: Google Fonts (Material Symbols + Roboto) dosyalarını ve statik
// varlıkları cache'e alıp sonraki açılışlarda ANINDA, ağ beklemeden sunmak.

const CACHE_VERSION = 'v2';
const FONT_CACHE = `nutriturk-fonts-${CACHE_VERSION}`;
const STATIC_CACHE = `nutriturk-static-${CACHE_VERSION}`;

// Uygulama ilk yüklendiğinde önden ısıtmak istediğimiz font CSS dosyaları.
// (Gerçek .woff2 dosyalarının URL'leri bu CSS'in içinden gelir, statik
// olarak bilinmedikleri için ilk fetch anında cache'e eklenirler.)
const FONT_CSS_URLS = [
  'https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap',
  'https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&display=block'
];

self.addEventListener('install', (event) => {
  self.skipWaiting();
  event.waitUntil(
    caches.open(FONT_CACHE).then((cache) => {
      // Hata verirse (ör. offline ilk kurulum) install'u bozmasın
      return Promise.all(
        FONT_CSS_URLS.map((url) =>
          fetch(url, { mode: 'cors' })
            .then((res) => cache.put(url, res))
            .catch(() => null)
        )
      );
    })
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) =>
      Promise.all(
        keys
          .filter((k) => k !== FONT_CACHE && k !== STATIC_CACHE)
          .map((k) => caches.delete(k))
      )
    ).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (event) => {
  const url = event.request.url;
  const isFontHost =
    url.startsWith('https://fonts.googleapis.com') ||
    url.startsWith('https://fonts.gstatic.com');

  if (isFontHost) {
    // CACHE-FIRST: Font CSS'i ve gerçek .woff2 dosyaları neredeyse hiç
    // değişmez. Cache'te varsa ağa hiç gitmeden anında döndür.
    event.respondWith(
      caches.open(FONT_CACHE).then((cache) =>
        cache.match(event.request).then((cached) => {
          if (cached) return cached;
          return fetch(event.request).then((res) => {
            // Başarılı yanıtı cache'e yaz, sonraki açılış anında olsun
            if (res && res.status === 200) {
              cache.put(event.request, res.clone());
            }
            return res;
          }).catch(() => cached);
        })
      )
    );
    return;
  }

  // Diğer (uygulama içi) istekler için ağ öncelikli, olmazsa cache
  event.respondWith(
    fetch(event.request).catch(() =>
      caches.match(event.request)
    )
  );
});
