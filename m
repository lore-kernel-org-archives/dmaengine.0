Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [LINUX,3/4] dmaengine: xilinx_dma: Fix compilation warning
From: Appana Durga Kedareswara Rao <appanad@xilinx.com>
Message-Id: <CY1PR02MB16927BA88135B20041A551AFDC1E0@CY1PR02MB1692.namprd02.prod.outlook.com>
Date: Wed, 3 Jan 2018 06:10:36 +0000
To: Vinod Koul <vinod.koul@intel.com>
Cc: "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "lars@metafoo.de" <lars@metafoo.de>, "akinobu.mita@gmail.com" <akinobu.mita@gmail.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>, "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>, "kedare06@gmail.com" <kedare06@gmail.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

SGkgVmlub2QsCgoKPk9uIFdlZCwgSmFuIDAzLCAyMDE4IGF0IDA1OjEzOjI5QU0gKzAwMDAsIEFw
cGFuYSBEdXJnYSBLZWRhcmVzd2FyYSBSYW8KPndyb3RlOgo+PiBIaSBWaW5vZCwKPj4KPj4gCVRo
YW5rcyBmb3IgdGhlIHJldmlldy4uLgo+Pgo+PiA+Cj4+ID5PbiBUaHUsIERlYyAyMSwgMjAxNyBh
dCAwMzo0MTozN1BNICswNTMwLCBLZWRhcmVzd2FyYSByYW8gQXBwYW5hIHdyb3RlOgo+PiA+Cj4+
ID5GaXggdGl0bGUgaGVyZSB0b28KPj4KPj4gU3VyZSB3aWxsIGZpeCBpbiB2Mi4uLgo+Pgo+PiA+
Cj4+ID5CVFcgd2hhdHMgd2l0aCBMSU5VWCB0YWcgaW4gcGF0Y2hlcywgcGxzIGRyb3AgdGhlbQo+
Pgo+PiBPayB3aWxsIG1lbnRpb24gdGhlIExpbnV4IHRhZyBpbmZvIGluIHRoZSBjb3ZlciBsZXR0
ZXIgcGF0Y2ggZnJvbSB0aGUKPj4gbmV4dCBwYXRjaCBzZXJpZXMgb24gd2FyZHMuLi4KPgo+UGxl
YXNlIHdyYXAgeW91ciByZXBsaWVzIHdpdGhpbiA4MGNoYXJzLiBJdCBpcyB2ZXJ5IGhhcmQgdG8g
cmVhZCEgSSBoYXZlIHJlZmxvd24gZm9yCj5yZWFkYWJpbGl0eQoKU3VyZSB3aWxsIHRha2UgY2Fy
ZSBvZiBpdCBuZXh0IHRpbWUgb253YXJkcy4uLiAKCj4KPkNhbiB5b3UgZXhwbGFpbiB3aGF0IHlv
dSBtZWFuIGJ5IHRoYXQgaW5mbywgd2hhdCBhcmUgeW91IHRyeWluZyB0byBjb252ZXk/CgpXaGF0
IEkgbWVhbiBoZXJlIGlzIHdpbGwgbWVudGlvbiB0aGUgTGludXgga2VybmVsIHRhZwpJbmZvcm1h
dGlvbiBpbiB0aGUgY292ZXIgbGV0dGVyIHBhdGNoLi4uCgpSZWdhcmRzLApLZWRhci4KCj4KPi0t
Cj5+Vmlub2QKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5l
ICJ1bnN1YnNjcmliZSBkbWFlbmdpbmUiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpv
cmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2Vy
Lmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
