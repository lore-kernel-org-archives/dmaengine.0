Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [01/18] MIPS: lantiq: pass struct device to DMA API functions
From: Paul Burton <paul.burton@mips.com>
Message-Id: <20190207232912.wfgejc5c6d6lk5so@pburton-laptop>
Date: Thu, 7 Feb 2019 23:29:14 +0000
To: Christoph Hellwig <hch@lst.de>
Cc: John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Felipe Balbi <balbi@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
List-ID: <dmaengine.vger.kernel.org>

SGkgQ2hyaXN0b3BoLAoKT24gRnJpLCBGZWIgMDEsIDIwMTkgYXQgMDk6NDc6NDRBTSArMDEwMCwg
Q2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVGhlIERNQSBBUEkgZ2VuZXJhbGx5IHJlbGllcyBv
biBhIHN0cnVjdCBkZXZpY2UgdG8gd29yayBwcm9wZXJseSwgYW5kCj4gb25seSBiYXJlbHkgd29y
a3Mgd2l0aG91dCBvbmUgZm9yIGxlZ2FjeSByZWFzb25zLiAgUGFzcyB0aGUgZWFzaWx5Cj4gYXZh
aWxhYmxlIHN0cnVjdCBkZXZpY2UgZnJvbSB0aGUgcGxhdGZvcm1fZGV2aWNlIHRvIHJlbWVkeSB0
aGlzLgo+IAo+IEFsc28gdXNlIEdGUF9LRVJORUwgaW5zdGVhZCBvZiBHRlBfQVRPTUlDIGFzIHRo
ZSBnZnBfdCBmb3IgdGhlIG1lbW9yeQo+IGFsbG9jYXRpb24sIGFzIHdlIGFyZW4ndCBpbiBpbnRl
cnJ1cHQgY29udGV4dCBvciB1bmRlciBhIGxvY2suCj4gCj4gTm90ZSB0aGF0IHRoaXMgd2hvbGUg
ZnVuY3Rpb24gbG9va3Mgc29tZXdoYXQgYm9ndXMgZ2l2ZW4gdGhhdCB3ZSBuZXZlcgo+IGV2ZW4g
bG9vayBhdCB0aGUgcmV0dXJuZWQgZG1hIGFkZHJlc3MsIGFuZCB0aGUgQ1BIWVNBRERSIG1hZ2lj
IG9uCj4gYSByZXR1cm5lZCBub25jYWNoZWQgbWFwcGluZyBsb29rcyAiaW50ZXJlc3RpbmciLiAg
QnV0IEknbGwgbGVhdmUKPiB0aGF0IHRvIHBlb3BsZSBtb3JlIGZhbWlsaWFyIHdpdGggdGhlIGNv
ZGUgdG8gc29ydCBvdXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBsc3QuZGU+Cj4gLS0tCj4gIGFyY2gvbWlwcy9sYW50aXEveHdheS92bW1jLmMgfCA0ICsrLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCldvdWxk
IHlvdSBsaWtlIHRoaXMgdG8gZ28gdGhyb3VnaCB0aGUgTUlQUyB0cmVlIG9yIGVsc2V3aGVyZT8g
SWYgdGhlCmxhdHRlcjoKCiAgICBBY2tlZC1ieTogUGF1bCBCdXJ0b24gPHBhdWwuYnVydG9uQG1p
cHMuY29tPgoKVGhhbmtzLAogICAgUGF1bAo=
