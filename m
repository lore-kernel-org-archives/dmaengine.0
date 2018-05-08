Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next] dmaengine: sprd: Fix potential NULL dereference in sprd_dma_probe()
From: Vinod Koul <vinod.koul@linaro.org>
Message-Id: <20180508120534.GB22536@vkoul-mobl>
Date: Tue, 8 May 2018 17:35:34 +0530
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gMDgtMDUtMTgsIDEzOjQ2LCBMYXJzLVBldGVyIENsYXVzZW4gd3JvdGU6Cj4gT24gMDUvMDcv
MjAxOCAwMzo0MCBBTSwgV2VpIFlvbmdqdW4gd3JvdGU6Cj4gPiAgCXJlcyA9IHBsYXRmb3JtX2dl
dF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4gPiArCWlmICghcmVzKQo+ID4g
KwkJcmV0dXJuIC1FSU5WQUw7Cj4gPiAgCXNkZXYtPmdsYl9iYXNlID0gZGV2bV9pb3JlbWFwX25v
Y2FjaGUoJnBkZXYtPmRldiwgcmVzLT5zdGFydCwKPiA+ICAJCQkJCSAgICAgIHJlc291cmNlX3Np
emUocmVzKSk7Cj4gCj4gSSB0aGluayBhIGJldHRlciBpbXByb3ZlbWVudCB3b3VsZCBiZSB0byBy
ZXBsYWNlIHRoaXMgd2l0aAo+IGRldm1faW9yZW1hcF9yZXNvdXJjZSgpIHdoaWNoIGhhcyB0aGUg
TlVMTCBwb2ludGVyIGNoZWNrIGFuZCBzb21lIG90aGVyCj4gdGhpbmdzIGJ1aWx0LWluLgoKU3Vy
ZSBmZWVsIGZyZWUgdG8gc2VuZCBhIHBhdGNoIDopCg==
