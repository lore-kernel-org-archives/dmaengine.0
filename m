Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [12/18] fotg210-udc: remove a bogus dma_sync_single_for_device call
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20190201084801.10983-13-hch@lst.de>
Date: Fri,  1 Feb 2019 09:47:55 +0100
To: John Crispin <john@phrozen.org>, Vinod Koul <vkoul@kernel.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Nicolas Ferre <nicolas.ferre@microchip.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Felipe Balbi <balbi@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
Cc: iommu@lists.linux-foundation.org
List-ID: <dmaengine.vger.kernel.org>

ZG1hX21hcF9zaW5nbGUgYWxyZWFkeSB0cmFuc2ZlcnMgb3duZXJzaGlwIHRvIHRoZSBkZXZpY2Uu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2
ZXJzL3VzYi9nYWRnZXQvdWRjL2ZvdGcyMTAtdWRjLmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZm90
ZzIxMC11ZGMuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZm90ZzIxMC11ZGMuYwppbmRleCBi
YzZhYmFlYTkwN2QuLmZlOWNmNDE1ZjJmMSAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0
L3VkYy9mb3RnMjEwLXVkYy5jCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZm90ZzIxMC11
ZGMuYwpAQCAtMzU2LDEwICszNTYsNiBAQCBzdGF0aWMgdm9pZCBmb3RnMjEwX3N0YXJ0X2RtYShz
dHJ1Y3QgZm90ZzIxMF9lcCAqZXAsCiAJCXJldHVybjsKIAl9CiAKLQlkbWFfc3luY19zaW5nbGVf
Zm9yX2RldmljZShOVUxMLCBkLCBsZW5ndGgsCi0JCQkJICAgZXAtPmRpcl9pbiA/IERNQV9UT19E
RVZJQ0UgOgotCQkJCQlETUFfRlJPTV9ERVZJQ0UpOwotCiAJZm90ZzIxMF9lbmFibGVfZG1hKGVw
LCBkLCBsZW5ndGgpOwogCiAJLyogY2hlY2sgaWYgZG1hIGlzIGRvbmUgKi8K
