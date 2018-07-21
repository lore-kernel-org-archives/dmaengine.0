Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,13/18] dmaengine: dma-jz4780: Set DTCn register explicitly
From: Randy Dunlap <rdunlap@infradead.org>
Message-Id: <bd06e477-a253-48f2-2b3e-dc48b2a12841@infradead.org>
Date: Sat, 21 Jul 2018 08:10:16 -0700
To: Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <dmaengine.vger.kernel.org>

T24gMDcvMjEvMjAxOCAwNDowNiBBTSwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiBGcm9tOiBEYW5p
ZWwgU2lsc2J5IDxkYW5zaWxzYnlAZ21haWwuY29tPgo+IAo+IE5vcm1hbGx5LCB3ZSB3b3VsZG4n
dCBzZXQgdGhlIGNoYW5uZWwgdHJhbnNmZXIgY291bnQgcmVnaXN0ZXIgZGlyZWN0bHkKPiB3aGVu
IHVzaW5nIGRlc2NyaXB0b3ItZHJpdmVuIHRyYW5zZmVycy4gSG93ZXZlciwgdGhlcmUgaXMgbm8g
aGFybSBpbgo+IGRvaW5nIHNvLCBhbmQgaXQgYWxsb3dzIGp6NDc4MF9kbWFfZGVzY19yZXNpZHVl
KCkgdG8gcmVwb3J0IHRoZSBjb3JyZWN0Cj4gcmVzaWR1ZSBvZiBhbiBvbmdvaW5nIHRyYW5zZmVy
LCBubyBtYXR0ZXIgd2hlbiBpdCBpcyBjYWxsZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFNpbHNieSA8ZGFuc2lsc2J5QGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6IE1hdGhpZXUgTWFsYXRl
cnJlIDxtYWxhdEBkZWJpYW4ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2RtYS9kbWEtano0NzgwLmMg
fCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpIaSwKCkRv
Y3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0IHNheXM6CgpUaGUgU2ln
bmVkLW9mZi1ieTogdGFnIGluZGljYXRlcyB0aGF0IHRoZSBzaWduZXIgd2FzIGludm9sdmVkIGlu
IHRoZQpkZXZlbG9wbWVudCBvZiB0aGUgcGF0Y2gsIG9yIHRoYXQgaGUvc2hlIHdhcyBpbiB0aGUg
cGF0Y2gncyBkZWxpdmVyeSBwYXRoLgoKVGhhdCBtZWFucyB0aGF0IHBhdGNoZXMgdGhhdCBhcmUg
ZnJvbSBEYW5pZWwgYnV0IHlvdSBzZW5kIChkZWxpdmVyeSBwYXRoKQpzaG91bGQgYWxzbyBiZSBT
aWduZWQtb2ZmLWJ5OiB5b3UuCg==
