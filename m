Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next] dmaengine: sprd: Fix potential NULL dereference in sprd_dma_probe()
From: Vinod Koul <vinod.koul@linaro.org>
Message-Id: <20180507080429.GA14832@vkoul-mobl>
Date: Mon, 7 May 2018 13:34:29 +0530
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gTW9uLCBNYXkgMDcsIDIwMTggYXQgMDE6NDA6MzRBTSArMDAwMCwgV2VpIFlvbmdqdW4gd3Jv
dGU6Cj4gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKCkgbWF5IGZhaWwgYW5kIHJldHVybiBOVUxMLCBz
byB3ZSBzaG91bGQKPiBiZXR0ZXIgY2hlY2sgaXQncyByZXR1cm4gdmFsdWUgdG8gYXZvaWQgYSBO
VUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UKPiBhIGJpdCBsYXRlciBpbiB0aGUgY29kZS4KPiAKPiBU
aGlzIGlzIGRldGVjdGVkIGJ5IENvY2NpbmVsbGUgc2VtYW50aWMgcGF0Y2guCgpBcHBsaWVkLCB0
aGFua3MK
