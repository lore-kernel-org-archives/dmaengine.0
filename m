Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v10,1/3] dmaengine: 8250_mtk_dma: add MediaTek uart DMA support
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20190219121420.GZ21884@vkoul-mobl>
Date: Tue, 19 Feb 2019 17:44:20 +0530
To: Long Cheng <long.cheng@mediatek.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Sean Wang <sean.wang@mediatek.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Zhenbao Liu <zhenbao.liu@mediatek.com>
List-ID: <dmaengine.vger.kernel.org>

T24gMTQtMDItMTksIDEwOjQ0LCBMb25nIENoZW5nIHdyb3RlOgo+IE9uIE1vbiwgMjAxOS0wMi0w
NCBhdCAxMjo1MSArMDUzMCwgVmlub2QgS291bCB3cm90ZToKCj4gPiA+ICtzdGF0aWMgaW50IG10
a191YXJ0X2FwZG1hX2RldmljZV9wYXVzZShzdHJ1Y3QgZG1hX2NoYW4gKmNoYW4pCj4gPiA+ICt7
Cj4gPiA+ICsJLyoganVzdCBmb3IgY2hlY2sgY2FwcyBwYXNzICovCj4gPiA+ICsJcmV0dXJuIDA7
Cj4gPiA+ICt9Cj4gPiAKPiA+IHBsZWFzZSByZW1vdmUsIHRoaXMgaXMgbm90IGEgbWFuZGF0b3J5
IGZuCj4gCj4gQ2FuJ3QgcmVtb3ZlIGl0LiBCZWZvcmUgdGhlIG1haWwsIGkgaGFkIGV4cGxhaW5l
ZCBpdC4gaW4gODI1MCB1YXJ0Cj4gZnJhbWV3b3JrLCB3aWxsIGNoZWNrIHRoZSBmdW5jdGlvbi4u
CgpJIHRoaW5rIHlvdSBzaG91bGQgZml4IHRoZSA4MjUwIHVhcnQgdG8gaGFuZGxlIGRyaXZlciBu
b3QgaGF2aW5nIGEKcGF1c2UuIEtlZXBpbmcgYSBkdW1teSBwYXVzZSBpcyBqdXN0IHdyb25nIGFu
ZCBzZXRzIHdyb25nIGV4cGVjdGF0aW9ucwpmb3IgdWFydC4uCg==
