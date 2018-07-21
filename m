Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,02/18] dmaengine: dma-jz4780: Return error if not probed from DT
From: Paul Cercueil <paul@crapouillou.net>
Message-Id: <20180721110643.19624-3-paul@crapouillou.net>
Date: Sat, 21 Jul 2018 13:06:27 +0200
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, Paul Cercueil <paul@crapouillou.net>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <dmaengine.vger.kernel.org>

VGhlIGRyaXZlciBjYWxscyBjbGtfZ2V0KCkgd2l0aCB0aGUgY2xvY2sgbmFtZSBzZXQgdG8gTlVM
TCwgd2hpY2ggbWVhbnMKdGhhdCB0aGUgZHJpdmVyIGNvdWxkIG9ubHkgd29yayB3aGVuIHByb2Jl
ZCBmcm9tIGRldmljZXRyZWUuIEZyb20gbm93Cm9uLCB3ZSBleHBsaWNpdGx5IHJlcXVpcmUgdGhl
IGRyaXZlciB0byBiZSBwcm9iZWQgZnJvbSBkZXZpY2V0cmVlLgoKU2lnbmVkLW9mZi1ieTogUGF1
bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+ClRlc3RlZC1ieTogTWF0aGlldSBNYWxh
dGVycmUgPG1hbGF0QGRlYmlhbi5vcmc+Ci0tLQogZHJpdmVycy9kbWEvZG1hLWp6NDc4MC5jIHwg
NSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKIHYyOiBOZXcgcGF0Y2gK
IHYzOiBObyBjaGFuZ2UKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9kbWEtano0NzgwLmMgYi9k
cml2ZXJzL2RtYS9kbWEtano0NzgwLmMKaW5kZXggODU4MjBhMmQ2OWQ0Li45ODc4OTk2MTBiNDYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hL2RtYS1qejQ3ODAuYworKysgYi9kcml2ZXJzL2RtYS9k
bWEtano0NzgwLmMKQEAgLTc2MSw2ICs3NjEsMTEgQEAgc3RhdGljIGludCBqejQ3ODBfZG1hX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IHJlc291cmNlICpyZXM7
CiAJaW50IGksIHJldDsKIAorCWlmICghZGV2LT5vZl9ub2RlKSB7CisJCWRldl9lcnIoZGV2LCAi
VGhpcyBkcml2ZXIgbXVzdCBiZSBwcm9iZWQgZnJvbSBkZXZpY2V0cmVlXG4iKTsKKwkJcmV0dXJu
IC1FSU5WQUw7CisJfQorCiAJanpkbWEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmp6ZG1h
KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFqemRtYSkKIAkJcmV0dXJuIC1FTk9NRU07Cg==
