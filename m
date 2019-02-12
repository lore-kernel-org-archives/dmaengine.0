Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [01/18] MIPS: lantiq: pass struct device to DMA API functions
From: Paul Burton <paul.burton@mips.com>
Message-Id: <MWHPR2201MB12775A18B8F8F034F44D61BAC1650@MWHPR2201MB1277.namprd22.prod.outlook.com>
Date: Tue, 12 Feb 2019 17:41:27 +0000
To: Christoph Hellwig <hch@lst.de>
Cc: John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Felipe Balbi <balbi@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

SGVsbG8sCgpDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBUaGUgRE1BIEFQSSBnZW5lcmFsbHkg
cmVsaWVzIG9uIGEgc3RydWN0IGRldmljZSB0byB3b3JrIHByb3Blcmx5LCBhbmQKPiBvbmx5IGJh
cmVseSB3b3JrcyB3aXRob3V0IG9uZSBmb3IgbGVnYWN5IHJlYXNvbnMuICBQYXNzIHRoZSBlYXNp
bHkKPiBhdmFpbGFibGUgc3RydWN0IGRldmljZSBmcm9tIHRoZSBwbGF0Zm9ybV9kZXZpY2UgdG8g
cmVtZWR5IHRoaXMuCj4gCj4gQWxzbyB1c2UgR0ZQX0tFUk5FTCBpbnN0ZWFkIG9mIEdGUF9BVE9N
SUMgYXMgdGhlIGdmcF90IGZvciB0aGUgbWVtb3J5Cj4gYWxsb2NhdGlvbiwgYXMgd2UgYXJlbid0
IGluIGludGVycnVwdCBjb250ZXh0IG9yIHVuZGVyIGEgbG9jay4KPiAKPiBOb3RlIHRoYXQgdGhp
cyB3aG9sZSBmdW5jdGlvbiBsb29rcyBzb21ld2hhdCBib2d1cyBnaXZlbiB0aGF0IHdlIG5ldmVy
Cj4gZXZlbiBsb29rIGF0IHRoZSByZXR1cm5lZCBkbWEgYWRkcmVzcywgYW5kIHRoZSBDUEhZU0FE
RFIgbWFnaWMgb24KPiBhIHJldHVybmVkIG5vbmNhY2hlZCBtYXBwaW5nIGxvb2tzICJpbnRlcmVz
dGluZyIuICBCdXQgSSdsbCBsZWF2ZQo+IHRoYXQgdG8gcGVvcGxlIG1vcmUgZmFtaWxpYXIgd2l0
aCB0aGUgY29kZSB0byBzb3J0IG91dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4KCkFwcGxpZWQgdG8gbWlwcy1maXhlcy4KClRoYW5rcywKICAgIFBh
dWwKClsgVGhpcyBtZXNzYWdlIHdhcyBhdXRvLWdlbmVyYXRlZDsgaWYgeW91IGJlbGlldmUgYW55
dGhpbmcgaXMgaW5jb3JyZWN0CiAgdGhlbiBwbGVhc2UgZW1haWwgcGF1bC5idXJ0b25AbWlwcy5j
b20gdG8gcmVwb3J0IGl0LiBdCg==
