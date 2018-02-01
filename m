Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,6/6] device property: Constify device_get_match_data()
From: Sinan Kaya <okaya@codeaurora.org>
Message-Id: <b005dc97-e508-2402-a917-ee23958e0ec6@codeaurora.org>
Date: Thu, 1 Feb 2018 15:40:21 -0500
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, dmaengine <dmaengine@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vinod.koul@intel.com>
List-ID: <dmaengine.vger.kernel.org>

T24gMi8xLzIwMTggMzozOCBQTSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIFRodSwgMjAx
OC0wMi0wMSBhdCAxNTozNSAtMDUwMCwgU2luYW4gS2F5YSB3cm90ZToKPj4gT24gMi8xLzIwMTgg
MzoyMCBQTSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+Pj4gLXZvaWQgKmRldmljZV9nZXRfbWF0
Y2hfZGF0YShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+PiArY29uc3Qgdm9pZCAqZGV2aWNlX2dldF9t
YXRjaF9kYXRhKHN0cnVjdCBkZXZpY2UgKmRldikKPj4+ICB7Cj4+PiAtCXJldHVybiBmd25vZGVf
Y2FsbF9wdHJfb3AoZGV2X2Z3bm9kZShkZXYpLAo+Pj4gZGV2aWNlX2dldF9tYXRjaF9kYXRhLAo+
Pj4gLQkJCQkgIGRldik7Cj4+PiArCXJldHVybiBmd25vZGVfY2FsbF9wdHJfb3AoZGV2X2Z3bm9k
ZShkZXYpLAo+Pj4gZGV2aWNlX2dldF9tYXRjaF9kYXRhLCBkZXYpOwo+Pj4gIH0KPj4KPj4gSSBy
ZW1lbWJlciBoYXZpbmcgYSBjaGVja3BhdGNoIHByb2JsZW0gaGVyZS4KPiAKPiBJdCdzIGV4YWN0
bHkgNzkgY2hhcmFjdGVycy4gCj4gV2hhdCBwcm9ibGVtPwo+IAoKT0suIE1heWJlIHdpdGggb25l
IG9mIHRoZSB2ZXJzaW9ucyBJIHBvc3RlZC4gSnVzdCBjaGVja2luZy4K
