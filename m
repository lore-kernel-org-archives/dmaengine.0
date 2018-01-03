Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [LINUX,3/4] dmaengine: xilinx_dma: Fix compilation warning
From: Appana Durga Kedareswara Rao <appanad@xilinx.com>
Message-Id: <CY1PR02MB16925ABFD2B45091424DEA1EDC1E0@CY1PR02MB1692.namprd02.prod.outlook.com>
Date: Wed, 3 Jan 2018 09:09:42 +0000
To: Vinod Koul <vinod.koul@intel.com>
Cc: "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "lars@metafoo.de" <lars@metafoo.de>, "akinobu.mita@gmail.com" <akinobu.mita@gmail.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>, "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>, "kedare06@gmail.com" <kedare06@gmail.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

SGksCgo8U25pcD4KPj4+ID5CVFcgd2hhdHMgd2l0aCBMSU5VWCB0YWcgaW4gcGF0Y2hlcywgcGxz
IGRyb3AgdGhlbQo+Pj4KPj4+IE9rIHdpbGwgbWVudGlvbiB0aGUgTGludXggdGFnIGluZm8gaW4g
dGhlIGNvdmVyIGxldHRlciBwYXRjaCBmcm9tIHRoZQo+Pj4gbmV4dCBwYXRjaCBzZXJpZXMgb24g
d2FyZHMuLi4KPj4KPj5QbGVhc2Ugd3JhcCB5b3VyIHJlcGxpZXMgd2l0aGluIDgwY2hhcnMuIEl0
IGlzIHZlcnkgaGFyZCB0byByZWFkISBJIGhhdmUgcmVmbG93bgo+Zm9yCj4+cmVhZGFiaWxpdHkK
Pgo+U3VyZSB3aWxsIHRha2UgY2FyZSBvZiBpdCBuZXh0IHRpbWUgb253YXJkcy4uLgo+Cj4+Cj4+
Q2FuIHlvdSBleHBsYWluIHdoYXQgeW91IG1lYW4gYnkgdGhhdCBpbmZvLCB3aGF0IGFyZSB5b3Ug
dHJ5aW5nIHRvIGNvbnZleT8KPgo+V2hhdCBJIG1lYW4gaGVyZSBpcyB3aWxsIG1lbnRpb24gdGhl
IExpbnV4IGtlcm5lbCB0YWcKPkluZm9ybWF0aW9uIGluIHRoZSBjb3ZlciBsZXR0ZXIgcGF0Y2gu
Li4KCk9vcHMgc29ycnkgSSBtaXN1bmRlcnN0b29kIHlvdXIgY29tbWVudC4uLiAKSW4gbXkgY29t
cGFueSB3ZSBoYXZlIGludGVybmFsbHkgZGlmZmVyZW50IHByb2plY3RzClRvIGRpZmZlcmVudGlh
dGUgYi93IHRoZW0gd2UgdXN1YWxseSB1c2UgTElOVVggcHJlZml4CkJ5IG1pc3Rha2UgSSBoYXZl
IGFkZGVkIHRoZSBMSU5VWCBwcmVmaXggaW4gdGhpcyBwYXRjaCBzZXJpZXMKSSBoYXZlIHJlbW92
ZWQgaXQgaW4gdGhlIHYyIHNlcmllcy4uLiAKClJlZ2FyZHMsCktlZGFyLgoKPgo+UmVnYXJkcywK
PktlZGFyLgo+Cj4+Cj4+LS0KPj5+Vmlub2QKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBs
aXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBkbWFlbmdpbmUiIGluCnRoZSBib2R5IG9m
IGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGlu
Zm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
