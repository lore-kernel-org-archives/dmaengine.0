Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/6] ACPI / bus: Return error code from __acpi_match_device() in one case
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-Id: <1517846179.22495.27.camel@linux.intel.com>
Date: Mon, 05 Feb 2018 17:56:19 +0200
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: dmaengine <dmaengine@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Sinan Kaya <okaya@codeaurora.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vinod.koul@intel.com>
List-ID: <dmaengine.vger.kernel.org>

T24gU3VuLCAyMDE4LTAyLTA0IGF0IDA4OjE2ICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90
ZToKPiBPbiBUaHUsIEZlYiAxLCAyMDE4IGF0IDk6MjAgUE0sIEFuZHkgU2hldmNoZW5rbwo+IDxh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gSW5zdGVhZCBvZiBw
bGF5aW5nIHRyaWNrcyB3aXRoIGxhc3QgaW52YWxpZCBlbnRyeSwKPiA+IHJldHVybiBzaW1wbGUg
LUVOT0RBVEEgZXJyb3IgY29kZSBjYXN0ZWQgdG8gcG9pbnRlci4KPiA+IAo+ID4gSXQgd291bGQg
YmUgZ29vZCBmb3IgZnV0dXJlIGluIGNhc2UgY2FsbGVyIHBhc3NlcyBOVUxMIHBvaW50ZXIgZm9y
Cj4gPiBJRCB0YWJsZS4gTW9yZW92ZXIsIGNhbGxlciBjYW4gY2hlY2sgdGhlIGNvZGUgdG8gYmUg
c3VyZSB3aGF0Cj4gPiBoYXBwZW5lZAo+ID4gaW5zaWRlIGNhbGxlZS4KCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gaWQ7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gRVJSX1BUUigtRU5PREFUQSk7Cj4gCj4gU28gd2h5IGlzIHJldHVybmluZyBpZCBmcm9tIGhl
cmUgYSBwcm9ibGVtPwoKSSB0aGluayB5b3UgYWxyZWFkeSBub3RpY2VkIHRoYXQgaW4gdGhlIGZv
bGxvd2luZyBwYXRjaCBpdCBiZWNvbWVzIGEKcHJvYmxlbSBpZiB1c2VyIHN1cHBseSBpZHMgPT0g
TlVMTC4KClRoYXQncyB3aHkgSSBhZGRlZCBhIHNlY29uZCBwYXJhZ3JhcGggdG8gdGhlIGNvbW1p
dCBtZXNzYWdlIHRvIGV4cGxhaW4uCg==
