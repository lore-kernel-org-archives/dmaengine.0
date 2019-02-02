Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [02/18] dmaengine: imx-sdma: pass struct device to DMA API functions
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20190202172121.GA3739@lst.de>
Date: Sat, 2 Feb 2019 18:21:21 +0100
To: Vinod Koul <vkoul@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, John Crispin <john@phrozen.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Felipe Balbi <balbi@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, iommu@lists.linux-foundation.org
List-ID: <dmaengine.vger.kernel.org>

T24gU2F0LCBGZWIgMDIsIDIwMTkgYXQgMDM6NDE6MjFQTSArMDUzMCwgVmlub2QgS291bCB3cm90
ZToKPiBPbiAwMS0wMi0xOSwgMDk6NDcsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gVGhl
IERNQSBBUEkgZ2VuZXJhbGx5IHJlbGllcyBvbiBhIHN0cnVjdCBkZXZpY2UgdG8gd29yayBwcm9w
ZXJseSwgYW5kCj4gPiBvbmx5IGJhcmVseSB3b3JrcyB3aXRob3V0IG9uZSBmb3IgbGVnYWN5IHJl
YXNvbnMuICBQYXNzIHRoZSBlYXNpbHkKPiA+IGF2YWlsYWJsZSBzdHJ1Y3QgZGV2aWNlIGZyb20g
dGhlIHBsYXRmb3JtX2RldmljZSB0byByZW1lZHkgdGhpcy4KPiAKPiBUaGlzIGxvb2tzIGdvb2Qg
dG8gbWUgYnV0IGZhaWxzIHRvIGFwcGx5LiBDYW4geW91IHBsZWFzZSBiYXNlIGl0IG9uCj4gZG1h
ZW5naW5lLW5leHQgb3IgbGludXgtbmV4dCBwbGVhc2UgYW5kIHJlc2VuZAoKY29tbWl0IGNlYWY1
MjI2NTE0OGQzYTVjYTI0MjM3ZmQxYzcwOWNhYTVmNDYxODQKQXV0aG9yOiBBbmR5IER1YW4gPGZ1
Z2FuZy5kdWFuQG54cC5jb20+CkRhdGU6ICAgRnJpIEphbiAxMSAxNDoyOTo0OSAyMDE5ICswMDAw
CgogICAgZG1hZW5naW5lOiBpbXgtc2RtYTogcGFzcyAtPmRldiB0byBkbWFfYWxsb2NfY29oZXJl
bnQoKSBBUEkKCmluIGxpbnV4LW5leHQgYWN0dWFsbHkgaXMgZXF1aXZhbGVudCB0byB0aGlzIHBh
dGNoLCBzbyB3ZSBjYW4gZHJvcAp0aGlzIG9uZS4KCj4gCj4gVGhhbmtzCj4gLS0gCj4gflZpbm9k
Ci0tLWVuZCBxdW90ZWQgdGV4dC0tLQo=
