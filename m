Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v3,1/7] dmaengine: Add Synopsys eDMA IP core driver
From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Message-Id: <35c5c304-356d-1796-33e5-11f48cce704f@synopsys.com>
Date: Mon, 21 Jan 2019 09:14:36 +0000
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Jose Abreu <jose.abreu@synopsys.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Eugeniy Paltsev <eugeniy.paltsev@synopsys.com>, Russell King <rmk+kernel@armlinux.org.uk>, Niklas Cassel <niklas.cassel@linaro.org>, Joao Pinto <joao.pinto@synopsys.com>, Luis de Oliveira <luis.oliveira@synopsys.com>, Vitor Soares <vitor.soares@synopsys.com>, Nelson Costa <nelson.costa@synopsys.com>, Pedro Sousa <pedrom.sousa@synopsys.com>
List-ID: <dmaengine.vger.kernel.org>

T24gMTkvMDEvMjAxOSAxNjoyMSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIFdlZCwgSmFu
IDE2LCAyMDE5IGF0IDExOjUzOjAwQU0gKzAwMDAsIEd1c3Rhdm8gUGltZW50ZWwgd3JvdGU6Cj4+
IE9uIDE2LzAxLzIwMTkgMTA6MjEsIEpvc2UgQWJyZXUgd3JvdGU6Cj4+PiBPbiAxLzExLzIwMTkg
NjozMyBQTSwgR3VzdGF2byBQaW1lbnRlbCB3cm90ZToKPiAKPj4+PiArCS8qIEZyZWUgaXJxcyAq
Lwo+Pj4KPj4+IEJ1dCBkZXZtIHdpbGwgYXV0b21hdGljYWxseSBmcmVlIGl0LCBubyA/Cj4+Cj4+
IFllcywgaXQgc2hvdWxkbid0IGJlIHRoZXJlLiBJJ2xsIHJlbW92ZSBpdC4KPiAKPiBJdCBkZXBl
bmRzLiBJZiB0aGUgZHJpdmVyIGlzIHVzaW5nIHRhc2tsZXRzIGl0IG11c3QgZnJlZSBpdCBleHBs
aWNpdGx5IGxpa2UgdGhpcy4KCkluIHRoaXMgZHJpdmVyIEknbSBub3QgdXNpbmcgdGFza2xldHMu
Cgo+IAo+IFAuUy4gZGV2bV8qX2lycSgpIGlzIHF1aXRlIGRvdWJ0ZnVsIHRvIGhhdmUgaW4gdGhl
IGZpcnN0IHBsYWNlLgoKRm9yIGN1cmlvc2l0eSwgd2h5PwoKPiAJCj4K
