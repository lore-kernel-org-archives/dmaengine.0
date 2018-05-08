Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next] dmaengine: sprd: Fix potential NULL dereference in sprd_dma_probe()
From: Lars-Peter Clausen <lars@metafoo.de>
Message-Id: <ebdbc9bc-d78c-6338-7740-0d42894f917c@metafoo.de>
Date: Tue, 8 May 2018 14:10:36 +0200
To: Vinod Koul <vinod.koul@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gMDUvMDgvMjAxOCAwMjowNSBQTSwgVmlub2QgS291bCB3cm90ZToKPiBPbiAwOC0wNS0xOCwg
MTM6NDYsIExhcnMtUGV0ZXIgQ2xhdXNlbiB3cm90ZToKPj4gT24gMDUvMDcvMjAxOCAwMzo0MCBB
TSwgV2VpIFlvbmdqdW4gd3JvdGU6Cj4+PiAgCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShw
ZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4+PiArCWlmICghcmVzKQo+Pj4gKwkJcmV0dXJuIC1F
SU5WQUw7Cj4+PiAgCXNkZXYtPmdsYl9iYXNlID0gZGV2bV9pb3JlbWFwX25vY2FjaGUoJnBkZXYt
PmRldiwgcmVzLT5zdGFydCwKPj4+ICAJCQkJCSAgICAgIHJlc291cmNlX3NpemUocmVzKSk7Cj4+
Cj4+IEkgdGhpbmsgYSBiZXR0ZXIgaW1wcm92ZW1lbnQgd291bGQgYmUgdG8gcmVwbGFjZSB0aGlz
IHdpdGgKPj4gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCkgd2hpY2ggaGFzIHRoZSBOVUxMIHBvaW50
ZXIgY2hlY2sgYW5kIHNvbWUgb3RoZXIKPj4gdGhpbmdzIGJ1aWx0LWluLgo+IAo+IFN1cmUgZmVl
bCBmcmVlIHRvIHNlbmQgYSBwYXRjaCA6KQo+IAoKSSBwcmVmZXIgdG8gaW5zcGlyZSBvdGhlcnMg
OykKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1
YnNjcmliZSBkbWFlbmdpbmUiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9A
dmdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5l
bC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
