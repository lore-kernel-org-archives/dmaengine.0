Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next] dmaengine: sprd: Fix potential NULL dereference in sprd_dma_probe()
From: Baolin Wang <baolin.wang@linaro.org>
Message-Id: <CAMz4kuJ-xKsof+Nh9-kMqN9+8PHJ-2xb8abFrK5+_-LgpPpOfQ@mail.gmail.com>
Date: Wed, 9 May 2018 09:29:06 +0800
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Vinod Koul <vinod.koul@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gOCBNYXkgMjAxOCBhdCAyMDoxMCwgTGFycy1QZXRlciBDbGF1c2VuIDxsYXJzQG1ldGFmb28u
ZGU+IHdyb3RlOgo+IE9uIDA1LzA4LzIwMTggMDI6MDUgUE0sIFZpbm9kIEtvdWwgd3JvdGU6Cj4+
IE9uIDA4LTA1LTE4LCAxMzo0NiwgTGFycy1QZXRlciBDbGF1c2VuIHdyb3RlOgo+Pj4gT24gMDUv
MDcvMjAxOCAwMzo0MCBBTSwgV2VpIFlvbmdqdW4gd3JvdGU6Cj4+Pj4gICAgIHJlcyA9IHBsYXRm
b3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4+Pj4gKyAgIGlmICgh
cmVzKQo+Pj4+ICsgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+ICAgICBzZGV2LT5nbGJf
YmFzZSA9IGRldm1faW9yZW1hcF9ub2NhY2hlKCZwZGV2LT5kZXYsIHJlcy0+c3RhcnQsCj4+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVzb3VyY2Vfc2l6ZShy
ZXMpKTsKPj4+Cj4+PiBJIHRoaW5rIGEgYmV0dGVyIGltcHJvdmVtZW50IHdvdWxkIGJlIHRvIHJl
cGxhY2UgdGhpcyB3aXRoCj4+PiBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoKSB3aGljaCBoYXMgdGhl
IE5VTEwgcG9pbnRlciBjaGVjayBhbmQgc29tZSBvdGhlcgo+Pj4gdGhpbmdzIGJ1aWx0LWluLgo+
Pgo+PiBTdXJlIGZlZWwgZnJlZSB0byBzZW5kIGEgcGF0Y2ggOikKPj4KPgo+IEkgcHJlZmVyIHRv
IGluc3BpcmUgb3RoZXJzIDspCgpPSy4gSSB3aWxsIHNlbmQgb25lIGluY3JlbWVudGFsIHBhdGNo
IHRvIGZpeCB0aGlzIGlzc3VlLiBUaGFua3MuCg==
