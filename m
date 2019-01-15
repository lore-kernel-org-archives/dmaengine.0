Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v3,7/7] dmaengine: Add Synopsys eDMA IP test and sample driver
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-Id: <20190115054531.GC9170@smile.fi.intel.com>
Date: Tue, 15 Jan 2019 07:45:31 +0200
To: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Eugeniy Paltsev <eugeniy.paltsev@synopsys.com>, Russell King <rmk+kernel@armlinux.org.uk>, Niklas Cassel <niklas.cassel@linaro.org>, Joao Pinto <joao.pinto@synopsys.com>, Jose Abreu <jose.abreu@synopsys.com>, Luis Oliveira <luis.oliveira@synopsys.com>, Vitor Soares <vitor.soares@synopsys.com>, Nelson Costa <nelson.costa@synopsys.com>, Pedro Sousa <pedrom.sousa@synopsys.com>
List-ID: <dmaengine.vger.kernel.org>

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgMTE6NDQ6MjJBTSArMDAwMCwgR3VzdGF2byBQaW1lbnRl
bCB3cm90ZToKPiBPbiAxMS8wMS8yMDE5IDE5OjQ4LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4g
PiBPbiBGcmksIEphbiAxMSwgMjAxOSBhdCAwNzozMzo0M1BNICswMTAwLCBHdXN0YXZvIFBpbWVu
dGVsIHdyb3RlOgo+ID4+IEFkZCBTeW5vcHN5cyBlRE1BIElQIHRlc3QgYW5kIHNhbXBsZSBkcml2
ZXIgdG8gYmUgdXNlIGZvciB0ZXN0aW5nCj4gPj4gcHVycG9zZXMgYW5kIGFsc28gYXMgYSByZWZl
cmVuY2UgZm9yIGFueSBkZXZlbG9wZXIgd2hvIG5lZWRzIHRvCj4gPj4gaW1wbGVtZW50IGFuZCB1
c2UgU3lub3BzeXMgZURNQS4KPiA+Pgo+ID4+IFRoaXMgZHJpdmVyIGNhbiBiZSBjb21waWxlIGFz
IGJ1aWx0LWluIG9yIGV4dGVybmFsIG1vZHVsZSBpbiBrZXJuZWwuCj4gPj4KPiA+PiBUbyBlbmFi
bGUgdGhpcyBkcml2ZXIganVzdCBzZWxlY3QgRFdfRURNQV9URVNUIG9wdGlvbiBpbiBrZXJuZWwK
PiA+PiBjb25maWd1cmF0aW9uLCBob3dldmVyIGl0IHJlcXVpcmVzIGFuZCBzZWxlY3RzIGF1dG9t
YXRpY2FsbHkgRFdfRURNQQo+ID4+IG9wdGlvbiB0b28uCj4gPj4KPiA+IAo+ID4gSG1tLi4uIFRo
aXMgZG9lc24ndCBleHBsYWluIHdoYXQncyB3cm9uZyB3aXRoIGRtYXRlc3QgbW9kdWxlLgo+IAo+
IFRoZXJlIGlzbid0IGFueXRoaW5nIHdyb25nIHdpdGggZG1hdGVzdCBtb2R1bGUsIHRoYXQgSSBr
bm93IG9mLiBJbiBiZWdpbm5pbmcgSQo+IHdhcyBwbGFubmluZyB0byB1c2VkIGl0LCBob3dldmVy
IG9ubHkgd29ya3Mgd2l0aCBNRU1fVE9fTUVNIHRyYW5zZmVycywgdGhhdCdzCj4gd2h5IEkgY3Jl
YXRlZCBhIHNpbWlsYXIgbW9kdWxlIGJ1dCBmb3IgTUVNX1RPX0RFViBhbmQgREVWX1RPX01FTSB3
aXRoCj4gc2NhdHRlci1nYXRoZXIgYW5kIGN5Y2xpYyB0cmFuc2ZlcnMgdHlwZSBmb3IgbXkgdXNl
IGNhc2UuIEkgZG9uJ3Qga25vdyBpZiBjYW4gYmUKPiBhcHBsaWVkIHRvIG90aGVyIGNhc2VzLCBp
ZiB0aGF0IGlzIGZlYXNpYmxlLCBJJ20gZ2xhZCB0byBzaGFyZSBpdC4KCldoYXQgSSdtIHRyeWlu
ZyB0byB0ZWxsIGlzIHRoYXQgdGhlIGRtYXRlc3QgZHJpdmVyIHdvdWxkIGJlIG5pY2UgdG8gaGF2
ZSBzdWNoCmNhcGFiaWxpdHkuCg==
