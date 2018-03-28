Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dma-mapping: clearing GFP_ZERO flag caused crashes of Ethernet on arc/hsdk board.
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20180328075313.GA19864@lst.de>
Date: Wed, 28 Mar 2018 09:53:13 +0200
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jesper.nilsson@axis.com" <jesper.nilsson@axis.com>, "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>, "hch@lst.de" <hch@lst.de>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "Evgeniy.Didin@synopsys.com" <Evgeniy.Didin@synopsys.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>
List-ID: <dmaengine.vger.kernel.org>

PiA+IFRoZSBsb2dpY2FsIHF1ZXN0aW9uIGlzIHdoeT8KPiAKPiAxLiBTZWUgdGhhdCdzIGFub3Ro
ZXIgcGxhdGZvcm0gd2l0aCBBUkMgY29yZSBzbyBtYXliZSBpbiBjYXNlIG9mIEFSTQo+ICAgIERN
QSBhbGxvY2F0b3IgYWxyZWFkeSB6ZXJvZXMgcGFnZXMgcmVnYXJkbGVzcyBwcm92aWRlZCBmbGFn
cyAtCj4gICAgcGVyc29uYWxseSBJIGRpZG4ndCBjaGVjayB0aGF0LgoKWWVzLCBtb3N0IGFyY2hp
dGVjdHVyZXMgYWx3YXlzIGNsZWFyIG1lbW9yeSByZXR1cm5lZCBieSBkbWFfYWxsb2MqLgpMb29r
cyBsaWtlIGEgZmV3IGRvbid0IGFuZCBteSBjb21taXQgZ290IHRoZW0gaW4gdHJvdWJsZS4gIEFz
IHVzdWFsCkknZCBwcmVmZXIgdG8gbWF0Y2ggeDg2IHNlbWFudGljcyBmb3Igbm93IHRvIGF2b2lk
IHByb2JsZW1zLgoKSSdsbCBzZW5kIHBhdGNoZXMgZm9yIGFyYyBhbmQgczM5MCB3aGljaCBzZWVt
IHRvIGJlIGFjdHVhbGx5IHVzZWQKaG9sZG91dHMsIGFuZCB3aWxsIGxvb2sgaWYgYW55b25lIGVs
c2UgaXMgYWxzbyBhZmZlY3RlZC4KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBz
ZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBkbWFlbmdpbmUiIGluCnRoZSBib2R5IG9mIGEgbWVz
c2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQg
IGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
