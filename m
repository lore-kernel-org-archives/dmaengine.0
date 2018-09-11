Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,7/7] dmaengine: stm32-mdma: enable descriptor_reuse
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-Id: <1536650820-16076-8-git-send-email-pierre-yves.mordret@st.com>
Date: Tue, 11 Sep 2018 09:27:00 +0200
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-ID: <dmaengine.vger.kernel.org>

ZW5hYmxlIHJldXNlIHRvIHNwYXJlIGRlc2NyaXB0b3JzIGNyZWF0aW9uIG9uIGNyaXRpY2FsIFVD
LgoKU2lnbmVkLW9mZi1ieTogUGllcnJlLVl2ZXMgTU9SRFJFVCA8cGllcnJlLXl2ZXMubW9yZHJl
dEBzdC5jb20+Ci0tLQogIFZlcnNpb24gaGlzdG9yeToKICAgIHYxOgogICAgICAgKiBJbml0aWFs
Ci0tLQotLS0KIGRyaXZlcnMvZG1hL3N0bTMyLW1kbWEuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9zdG0zMi1tZG1hLmMg
Yi9kcml2ZXJzL2RtYS9zdG0zMi1tZG1hLmMKaW5kZXggNmI2ZTYzYi4uODBhMTdkZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9kbWEvc3RtMzItbWRtYS5jCisrKyBiL2RyaXZlcnMvZG1hL3N0bTMyLW1k
bWEuYwpAQCAtMTcxNSw2ICsxNzE1LDggQEAgc3RhdGljIGludCBzdG0zMl9tZG1hX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJZGQtPmRldmljZV9yZXN1bWUgPSBzdG0zMl9t
ZG1hX3Jlc3VtZTsKIAlkZC0+ZGV2aWNlX3Rlcm1pbmF0ZV9hbGwgPSBzdG0zMl9tZG1hX3Rlcm1p
bmF0ZV9hbGw7CiAJZGQtPmRldmljZV9zeW5jaHJvbml6ZSA9IHN0bTMyX21kbWFfc3luY2hyb25p
emU7CisJZGQtPmRlc2NyaXB0b3JfcmV1c2UgPSB0cnVlOworCiAJZGQtPnNyY19hZGRyX3dpZHRo
cyA9IEJJVChETUFfU0xBVkVfQlVTV0lEVEhfMV9CWVRFKSB8CiAJCUJJVChETUFfU0xBVkVfQlVT
V0lEVEhfMl9CWVRFUykgfAogCQlCSVQoRE1BX1NMQVZFX0JVU1dJRFRIXzRfQllURVMpIHwK
