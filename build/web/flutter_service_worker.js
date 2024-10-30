'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "90baff25c1c0e796f70cd00942dbea5c",
"assets/AssetManifest.bin.json": "9952ac78dbca681397a6934f2591354b",
"assets/AssetManifest.json": "44835e86c502baad9e56091583205775",
"assets/assets/box/nuvem.png": "8ecc798cb22ae0dd5a998e26602c431f",
"assets/assets/box/precipitation.png": "6df17201a69bb609d415290f9ee56997",
"assets/assets/box/wind.png": "36fae1b363faa798184dee3c46aac023",
"assets/assets/icons/1.png": "e683487a006ab25e0ca9b1cb1a781907",
"assets/assets/icons/10.png": "5371eaa308ecf7f257c4c6976df66f30",
"assets/assets/icons/11.png": "dcb3a7624630dfd89b713c87fae51d94",
"assets/assets/icons/12.png": "0ac8dbd91a4fe6d2dbb4b059526489fd",
"assets/assets/icons/13.png": "9f5264b6a532478c7187b6c1bf2e03ca",
"assets/assets/icons/14.png": "4d4246110706a54797bd91e94606d361",
"assets/assets/icons/15.png": "c637923abbc1d8a35023cf4a1b5dddf8",
"assets/assets/icons/16.png": "b4781b0712533384f8c8c506356f9467",
"assets/assets/icons/17.png": "a2f9aeb51e5889d0c4e7699749fb5042",
"assets/assets/icons/18.png": "ed3c321f7509543bf8a84765a7cb11e6",
"assets/assets/icons/19.png": "7b11a686ef6b1432e6b58047a4f9e306",
"assets/assets/icons/2.png": "bff8532112750012a3a4a9d48fbb27ab",
"assets/assets/icons/20.png": "400d69aa80886ddc961209b98d0ec5ab",
"assets/assets/icons/21.png": "dbbf2a4cf684bade1eb1482c9ef03bd3",
"assets/assets/icons/22.png": "f89129c742bf6f80408611de16b8a821",
"assets/assets/icons/23.png": "bfb56660110c47d8679608ccb584706c",
"assets/assets/icons/24.png": "3f7931bd31111301fe4341da9bfb702c",
"assets/assets/icons/25.png": "3f11cba878dabd8f5abc84262c558eac",
"assets/assets/icons/26.png": "bff8532112750012a3a4a9d48fbb27ab",
"assets/assets/icons/27.png": "bf7df485ab1afb6a6d02deba35ec8cef",
"assets/assets/icons/28.png": "64cf68c49eb5299db9e8b2beaca0867d",
"assets/assets/icons/29.png": "eeeb898d363934c3adca9e7d0afb72b0",
"assets/assets/icons/3.png": "bf7df485ab1afb6a6d02deba35ec8cef",
"assets/assets/icons/30.png": "fa15d3d2a0f6eafde27330ad0499fc88",
"assets/assets/icons/31.png": "c1669a8be255bb9b4d7112c024546cd4",
"assets/assets/icons/32.png": "9f5264b6a532478c7187b6c1bf2e03ca",
"assets/assets/icons/33.png": "c637923abbc1d8a35023cf4a1b5dddf8",
"assets/assets/icons/34.png": "7b11a686ef6b1432e6b58047a4f9e306",
"assets/assets/icons/35.png": "f89129c742bf6f80408611de16b8a821",
"assets/assets/icons/36.png": "3f7931bd31111301fe4341da9bfb702c",
"assets/assets/icons/4.png": "64cf68c49eb5299db9e8b2beaca0867d",
"assets/assets/icons/5.png": "eeeb898d363934c3adca9e7d0afb72b0",
"assets/assets/icons/6.png": "fa15d3d2a0f6eafde27330ad0499fc88",
"assets/assets/icons/7.png": "425170786583ce9308e9fa0b6014692e",
"assets/assets/icons/8.png": "c1669a8be255bb9b4d7112c024546cd4",
"assets/assets/icons/9.png": "402d6c9a8ef732056d0825c8d301bbe0",
"assets/assets/loading.gif": "15b46dac096cf1acbae9349f1e2e9668",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/NOTICES": "681668231c1602167a1fec0ba6bdf7e9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "c4db201882cab9a9dd92a9fe30fbb6a9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "9f0018fe196fb83dd9a7222ab73072ec",
"/": "9f0018fe196fb83dd9a7222ab73072ec",
"main.dart.js": "ce7e8136cd0785b81cedf079d6ad8cc1",
"manifest.json": "24224c92c45e9b4b15aae1cb82c5ed71",
"version.json": "23e9d24d5b36279cbfede1d4ebb467c0"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
