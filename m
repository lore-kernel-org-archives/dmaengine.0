Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/6] ACPI / bus: Do not traverse through non-existed device table
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-Id: <1517517921.7000.1447.camel@linux.intel.com>
Date: Thu, 01 Feb 2018 22:45:21 +0200
To: Sinan Kaya <okaya@codeaurora.org>, dmaengine <dmaengine@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vinod.koul@intel.com>
List-ID: <dmaengine.vger.kernel.org>

T24gVGh1LCAyMDE4LTAyLTAxIGF0IDIyOjQwICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gVGh1LCAyMDE4LTAyLTAxIGF0IDE1OjMyIC0wNTAwLCBTaW5hbiBLYXlhIHdyb3RlOgo+
ID4gT24gMi8xLzIwMTggMzoyMCBQTSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4gPiBXaGVu
IF9fYWNwaV9tYXRjaF9kZXZpY2UoKSBpcyBjYWxsZWQgaXQgd291bGQgYmUgcG9zc2libGUgdG8g
aGF2ZQo+ID4gPiBBQ1BJIElEIHRhYmxlIGEgTVVMTCBwb2ludGVyLiBUbyBhdm9pZCBwb3RlbnRp
YWwgZGVyZWZlcmVuY2UsCj4gPiAKPiA+IE5VTEwKPiAKPiBUaGFua3MsIHdpbGwgZml4IGxhdGVy
Lgo+IAo+ID4gV2h5IG5vdCBiYWlsIG91dCBoZXJlIGltbWVkaWF0ZWx5IGlmIGlkcyBpcyBudWxs
Pwo+IAo+IEJlY2F1c2Ugb2YgdGhlIGNvZGUgd2hpY2ggd2Fzbid0IGluIGNvbnRleHQgb2YgdGhp
cyBwYXRjaC4KPiAKPiBTZWUgYWxzbyBwYXRjaCAxIGluIHRoZSBzZXJpZXMuCj4gCj4gSXQncyBh
Ym91dCBob3cgYWNwaV9kcml2ZXJfbWF0Y2hfZGV2aWNlKCkgdXNlcyBpdC4KCkJ0dywgaXQgbWFr
ZXMgZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgdG8gd29yayBwcm9wZXJseSBvbiBQUlAwMDAxIGtp
bmQKb2YgZGV2aWNlcy4K
