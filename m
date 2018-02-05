Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/6] ACPI / bus: Do not traverse through non-existed device table
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-Id: <1517846207.22495.28.camel@linux.intel.com>
Date: Mon, 05 Feb 2018 17:56:47 +0200
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sinan Kaya <okaya@codeaurora.org>, dmaengine <dmaengine@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vinod.koul@intel.com>
List-ID: <dmaengine.vger.kernel.org>

T24gU3VuLCAyMDE4LTAyLTA0IGF0IDA4OjE4ICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90
ZToKPiBPbiBUaHUsIEZlYiAxLCAyMDE4IGF0IDk6NDUgUE0sIEFuZHkgU2hldmNoZW5rbwo+IDxh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gT24gVGh1LCAyMDE4
LTAyLTAxIGF0IDIyOjQwICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gPiA+IE9uIFRo
dSwgMjAxOC0wMi0wMSBhdCAxNTozMiAtMDUwMCwgU2luYW4gS2F5YSB3cm90ZToKPiA+ID4gPiBP
biAyLzEvMjAxOCAzOjIwIFBNLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gPiA+ID4gPiBXaGVu
IF9fYWNwaV9tYXRjaF9kZXZpY2UoKSBpcyBjYWxsZWQgaXQgd291bGQgYmUgcG9zc2libGUgdG8K
PiA+ID4gPiA+IGhhdmUKPiA+ID4gPiA+IEFDUEkgSUQgdGFibGUgYSBNVUxMIHBvaW50ZXIuIFRv
IGF2b2lkIHBvdGVudGlhbCBkZXJlZmVyZW5jZSwKPiA+ID4gPiAKPiA+ID4gPiBOVUxMCj4gPiA+
IAo+ID4gPiBUaGFua3MsIHdpbGwgZml4IGxhdGVyLgo+ID4gPiAKPiA+ID4gPiBXaHkgbm90IGJh
aWwgb3V0IGhlcmUgaW1tZWRpYXRlbHkgaWYgaWRzIGlzIG51bGw/Cj4gPiA+IAo+ID4gPiBCZWNh
dXNlIG9mIHRoZSBjb2RlIHdoaWNoIHdhc24ndCBpbiBjb250ZXh0IG9mIHRoaXMgcGF0Y2guCj4g
PiA+IAo+ID4gPiBTZWUgYWxzbyBwYXRjaCAxIGluIHRoZSBzZXJpZXMuCj4gPiA+IAo+ID4gPiBJ
dCdzIGFib3V0IGhvdyBhY3BpX2RyaXZlcl9tYXRjaF9kZXZpY2UoKSB1c2VzIGl0Lgo+ID4gCj4g
PiBCdHcsIGl0IG1ha2VzIGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpIHRvIHdvcmsgcHJvcGVybHkg
b24gUFJQMDAwMQo+ID4ga2luZAo+ID4gb2YgZGV2aWNlcy4KPiAKPiBNYXliZSBjb21iaW5lIHRo
aXMgb25lIHdpdGggdGhlIFsxLzZdIHRoZW4sIGl0IHdvdWxkIG1ha2UgaXQgc29tZXdoYXQKPiBl
YXNpZXIgdG8gZm9sbG93IHdoYXQncyBnb2luZyBvbi4KClN1cmUsIEkgd2lsbCBmb2xkIGluLgo=
