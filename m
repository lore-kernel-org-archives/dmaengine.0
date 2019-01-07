Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dmaengine: qcom: bam_dma: use struct_size() in kzalloc()
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20190107124017.GH13372@vkoul-mobl.Dlink>
Date: Mon, 7 Jan 2019 18:10:17 +0530
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Dan Williams <dan.j.williams@intel.com>, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gMDQtMDEtMTksIDExOjMyLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+IE9uZSBvZiB0
aGUgbW9yZSBjb21tb24gY2FzZXMgb2YgYWxsb2NhdGlvbiBzaXplIGNhbGN1bGF0aW9ucyBpcyBm
aW5kaW5nIHRoZQo+IHNpemUgb2YgYSBzdHJ1Y3R1cmUgdGhhdCBoYXMgYSB6ZXJvLXNpemVkIGFy
cmF5IGF0IHRoZSBlbmQsIGFsb25nIHdpdGggbWVtb3J5Cj4gZm9yIHNvbWUgbnVtYmVyIG9mIGVs
ZW1lbnRzIGZvciB0aGF0IGFycmF5LiBGb3IgZXhhbXBsZToKPiAKPiBzdHJ1Y3QgZm9vIHsKPiAg
ICAgaW50IHN0dWZmOwo+ICAgICB2b2lkICplbnRyeVtdOwo+IH07Cj4gCj4gaW5zdGFuY2UgPSBr
emFsbG9jKHNpemVvZihzdHJ1Y3QgZm9vKSArIHNpemVvZih2b2lkICopICogY291bnQsIEdGUF9L
RVJORUwpOwo+IAo+IEluc3RlYWQgb2YgbGVhdmluZyB0aGVzZSBvcGVuLWNvZGVkIGFuZCBwcm9u
ZSB0byB0eXBlIG1pc3Rha2VzLCB3ZSBjYW4gbm93Cj4gdXNlIHRoZSBuZXcgc3RydWN0X3NpemUo
KSBoZWxwZXI6Cj4gCj4gaW5zdGFuY2UgPSBremFsbG9jKHN0cnVjdF9zaXplKGluc3RhbmNlLCBl
bnRyeSwgY291bnQpLCBHRlBfS0VSTkVMKTsKPiAKPiBUaGlzIGNvZGUgd2FzIGRldGVjdGVkIHdp
dGggdGhlIGhlbHAgb2YgQ29jY2luZWxsZS4KCkFwcGxpZWQsIHRoYW5rcwo=
