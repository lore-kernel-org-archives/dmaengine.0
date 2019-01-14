Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v3,7/7] dmaengine: Add Synopsys eDMA IP test and sample driver
From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Message-Id: <2de7f43e-0702-9ab3-b24c-a1b212e18f7c@synopsys.com>
Date: Mon, 14 Jan 2019 11:44:22 +0000
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Eugeniy Paltsev <eugeniy.paltsev@synopsys.com>, Russell King <rmk+kernel@armlinux.org.uk>, Niklas Cassel <niklas.cassel@linaro.org>, Joao Pinto <joao.pinto@synopsys.com>, Jose Abreu <jose.abreu@synopsys.com>, Luis Oliveira <luis.oliveira@synopsys.com>, Vitor Soares <vitor.soares@synopsys.com>, Nelson Costa <nelson.costa@synopsys.com>, Pedro Sousa <pedrom.sousa@synopsys.com>
List-ID: <dmaengine.vger.kernel.org>

T24gMTEvMDEvMjAxOSAxOTo0OCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIEZyaSwgSmFu
IDExLCAyMDE5IGF0IDA3OjMzOjQzUE0gKzAxMDAsIEd1c3Rhdm8gUGltZW50ZWwgd3JvdGU6Cj4+
IEFkZCBTeW5vcHN5cyBlRE1BIElQIHRlc3QgYW5kIHNhbXBsZSBkcml2ZXIgdG8gYmUgdXNlIGZv
ciB0ZXN0aW5nCj4+IHB1cnBvc2VzIGFuZCBhbHNvIGFzIGEgcmVmZXJlbmNlIGZvciBhbnkgZGV2
ZWxvcGVyIHdobyBuZWVkcyB0bwo+PiBpbXBsZW1lbnQgYW5kIHVzZSBTeW5vcHN5cyBlRE1BLgo+
Pgo+PiBUaGlzIGRyaXZlciBjYW4gYmUgY29tcGlsZSBhcyBidWlsdC1pbiBvciBleHRlcm5hbCBt
b2R1bGUgaW4ga2VybmVsLgo+Pgo+PiBUbyBlbmFibGUgdGhpcyBkcml2ZXIganVzdCBzZWxlY3Qg
RFdfRURNQV9URVNUIG9wdGlvbiBpbiBrZXJuZWwKPj4gY29uZmlndXJhdGlvbiwgaG93ZXZlciBp
dCByZXF1aXJlcyBhbmQgc2VsZWN0cyBhdXRvbWF0aWNhbGx5IERXX0VETUEKPj4gb3B0aW9uIHRv
by4KPj4KPiAKPiBIbW0uLi4gVGhpcyBkb2Vzbid0IGV4cGxhaW4gd2hhdCdzIHdyb25nIHdpdGgg
ZG1hdGVzdCBtb2R1bGUuCgpUaGVyZSBpc24ndCBhbnl0aGluZyB3cm9uZyB3aXRoIGRtYXRlc3Qg
bW9kdWxlLCB0aGF0IEkga25vdyBvZi4gSW4gYmVnaW5uaW5nIEkKd2FzIHBsYW5uaW5nIHRvIHVz
ZWQgaXQsIGhvd2V2ZXIgb25seSB3b3JrcyB3aXRoIE1FTV9UT19NRU0gdHJhbnNmZXJzLCB0aGF0
J3MKd2h5IEkgY3JlYXRlZCBhIHNpbWlsYXIgbW9kdWxlIGJ1dCBmb3IgTUVNX1RPX0RFViBhbmQg
REVWX1RPX01FTSB3aXRoCnNjYXR0ZXItZ2F0aGVyIGFuZCBjeWNsaWMgdHJhbnNmZXJzIHR5cGUg
Zm9yIG15IHVzZSBjYXNlLiBJIGRvbid0IGtub3cgaWYgY2FuIGJlCmFwcGxpZWQgdG8gb3RoZXIg
Y2FzZXMsIGlmIHRoYXQgaXMgZmVhc2libGUsIEknbSBnbGFkIHRvIHNoYXJlIGl0LgoKPgo=
