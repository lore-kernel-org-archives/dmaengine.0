Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v6,1/2] dmaengine: 8250_mtk_dma: add MediaTek uart DMA support
From: Randy Dunlap <rdunlap@infradead.org>
Message-Id: <46c746fc-b400-ec6e-d6b1-899c3d594b19@infradead.org>
Date: Tue, 18 Dec 2018 19:12:33 -0800
To: Long Cheng <long.cheng@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Sean Wang <sean.wang@mediatek.com>, Sean Wang <sean.wang@kernel.org>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, YT Shen <yt.shen@mediatek.com>
List-ID: <dmaengine.vger.kernel.org>

SGksCkEgZmV3IHNtYWxsIGNvcnJlY3Rpb25zLi4uCgpPbiAxMi8xOC8xOCA2OjIwIFBNLCBMb25n
IENoZW5nIHdyb3RlOgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9tZWRpYXRlay9LY29uZmln
IGIvZHJpdmVycy9kbWEvbWVkaWF0ZWsvS2NvbmZpZwo+IGluZGV4IDI3YmFjMGIuLjJjMDgyYzkg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEvbWVkaWF0ZWsvS2NvbmZpZwo+ICsrKyBiL2RyaXZl
cnMvZG1hL21lZGlhdGVrL0tjb25maWcKPiBAQCAtMSw0ICsxLDE1IEBACj4gIAo+ICtjb25maWcg
RE1BX01US19VQVJUCj4gKwl0cmlzdGF0ZSAiTWVkaWFUZWsgU29DcyBBUERNQSBzdXBwb3J0IGZv
ciBVQVJUIgo+ICsJZGVwZW5kcyBvbiBPRiAmJiBTRVJJQUxfODI1MF9NVDY1NzcKPiArCXNlbGVj
dCBETUFfRU5HSU5FCj4gKwlzZWxlY3QgRE1BX1ZJUlRVQUxfQ0hBTk5FTFMKPiArCWhlbHAKPiAr
CSAgU3VwcG9ydCBmb3IgdGhlIFVBUlQgRE1BIGVuZ2luZSBmb3VuZCBvbiBNZWRpYVRlayBNVEsg
U29Dcy4KPiArCSAgd2hlbiBTRVJJQUxfODI1MF9NVDY1NzcgaXMgZW5hYmxlZCwgYW5kIGlmIHlv
dSB3YW50IHRvIHVzaW5nIERNQSwKCgkgIFdoZW4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB0byB1c2UgRE1BLAoKPiArCSAgeW91IGNhbiBlbmFibGUgdGhl
IGNvbmZpZy4gdGhlIERNQSBlbmdpbmUganVzdCBvbmx5IGJlIHVzZWQKCgkgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFRoZSBETUEgZW5naW5lIGNhbiBvbmx5IGJlIHVzZWQKCj4gKwkgIHdp
dGggTWVkaWFUZWsgU29Dcy4KPiArCgoKY2hlZXJzLAo=
