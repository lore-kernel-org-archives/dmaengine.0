Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/6] ACPI / bus: Rename acpi_get_match_data() to acpi_device_get_match_data()
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-Id: <1517847122.22495.35.camel@linux.intel.com>
Date: Mon, 05 Feb 2018 18:12:02 +0200
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: dmaengine <dmaengine@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Sinan Kaya <okaya@codeaurora.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vinod.koul@intel.com>
List-ID: <dmaengine.vger.kernel.org>

T24gU3VuLCAyMDE4LTAyLTA0IGF0IDA4OjIzICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90
ZToKPiBPbiBUaHUsIEZlYiAxLCAyMDE4IGF0IDk6MjAgUE0sIEFuZHkgU2hldmNoZW5rbwo+IDxh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gRG8gdGhlIHJlbmFt
aW5nIHRvIGJlIGNvbnNpc3RlbnQgd2l0aCBpdHMgc2libGluZywgaS5lLgo+ID4gb2ZfZGV2aWNl
X2dldF9tYXRjaF9kYXRhKCkuCj4gPiAKPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+ID4gCj4g
PiBGaXhlczogODAyMTJhMTYyMzI5ICgiQUNQSSAvIGJ1czogSW50cm9kdWNlIGFjcGlfZ2V0X21h
dGNoX2RhdGEoKQo+ID4gZnVuY3Rpb24iKQo+ID4gRml4ZXM6IDE0NmI0ZGJiMGVlZiAoIkFDUEk6
IHByb3BlcnRpZXM6IEltcGxlbWVudCBnZXRfbWF0Y2hfZGF0YSgpCj4gPiBjYWxsYmFjayIpCj4g
Cj4gV2h5IGFyZSB5b3UgYWRkaW5nIHRoZSBGaXhlczogdGFncyB0byBhIHBhdGNoIHRoYXQgZG9l
c24ndCBtYWtlIGFueQo+IGZ1bmN0aW9uYWwgY2hhbmdlcz8KPiAKPiBXaGF0IGFyZSB0aGV5IHVz
ZWZ1bCBmb3I/CgpCZWNhdXNlIG5leHQgcGF0Y2ggZGVwZW5kcyBvbiB0aGlzIG9uZSBhbmQgZml4
ZXMgQVBJLiAKU28sIGhlcmUgdGhlIEZpeGVzIHRhZ3MgdG8gYmUgc3VyZSB0aGF0IG5leHQgd2ls
bCBhcHBseSBjbGVhbmx5Lgo=
