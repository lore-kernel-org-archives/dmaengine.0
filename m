Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dmaengine: tegra-apb: Use struct_size() in devm_kzalloc()
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20190107124052.GJ13372@vkoul-mobl.Dlink>
Date: Mon, 7 Jan 2019 18:10:52 +0530
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gMDQtMDEtMTksIDE1OjE2LCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+IE9uZSBvZiB0
aGUgbW9yZSBjb21tb24gY2FzZXMgb2YgYWxsb2NhdGlvbiBzaXplIGNhbGN1bGF0aW9ucyBpcyBm
aW5kaW5nCj4gdGhlIHNpemUgb2YgYSBzdHJ1Y3R1cmUgdGhhdCBoYXMgYSB6ZXJvLXNpemVkIGFy
cmF5IGF0IHRoZSBlbmQsIGFsb25nCj4gd2l0aCBtZW1vcnkgZm9yIHNvbWUgbnVtYmVyIG9mIGVs
ZW1lbnRzIGZvciB0aGF0IGFycmF5LiBGb3IgZXhhbXBsZToKPiAKPiBzdHJ1Y3QgZm9vIHsKPiAg
ICAgaW50IHN0dWZmOwo+ICAgICB2b2lkICplbnRyeVtdOwo+IH07Cj4gCj4gaW5zdGFuY2UgPSBk
ZXZtX2t6YWxsb2MoZGV2LCBzaXplb2Yoc3RydWN0IGZvbykgKyBzaXplb2Yodm9pZCAqKSAqIGNv
dW50LCBHRlBfS0VSTkVMKTsKPiAKPiBJbnN0ZWFkIG9mIGxlYXZpbmcgdGhlc2Ugb3Blbi1jb2Rl
ZCBhbmQgcHJvbmUgdG8gdHlwZSBtaXN0YWtlcywgd2UgY2FuCj4gbm93IHVzZSB0aGUgbmV3IHN0
cnVjdF9zaXplKCkgaGVscGVyOgo+IAo+IGluc3RhbmNlID0gZGV2bV9remFsbG9jKGRldiwgc3Ry
dWN0X3NpemUoaW5zdGFuY2UsIGVudHJ5LCBjb3VudCksIEdGUF9LRVJORUwpOwo+IAo+IFRoaXMg
Y29kZSB3YXMgZGV0ZWN0ZWQgd2l0aCB0aGUgaGVscCBvZiBDb2NjaW5lbGxlLgoKQXBwbGllZCwg
dGhhbmtzCg==
