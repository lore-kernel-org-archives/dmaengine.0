Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,7/7] dmaengine: stm32-mdma: enable descriptor_reuse
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-Id: <1538139715-24406-8-git-send-email-pierre-yves.mordret@st.com>
Date: Fri, 28 Sep 2018 15:01:55 +0200
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-ID: <dmaengine.vger.kernel.org>

ZW5hYmxlIHJldXNlIHRvIHNwYXJlIGRlc2NyaXB0b3JzIGNyZWF0aW9uIG9uIGNyaXRpY2FsIFVD
LgoKU2lnbmVkLW9mZi1ieTogUGllcnJlLVl2ZXMgTU9SRFJFVCA8cGllcnJlLXl2ZXMubW9yZHJl
dEBzdC5jb20+Ci0tLQogIFZlcnNpb24gaGlzdG9yeToKICAgIHYzOgogICAgdjI6CiAgICB2MToK
ICAgICAgICogSW5pdGlhbAotLS0KLS0tCiBkcml2ZXJzL2RtYS9zdG0zMi1tZG1hLmMgfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9k
bWEvc3RtMzItbWRtYS5jIGIvZHJpdmVycy9kbWEvc3RtMzItbWRtYS5jCmluZGV4IDZiNmU2M2Iu
LjgwYTE3ZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hL3N0bTMyLW1kbWEuYworKysgYi9kcml2
ZXJzL2RtYS9zdG0zMi1tZG1hLmMKQEAgLTE3MTUsNiArMTcxNSw4IEBAIHN0YXRpYyBpbnQgc3Rt
MzJfbWRtYV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWRkLT5kZXZpY2Vf
cmVzdW1lID0gc3RtMzJfbWRtYV9yZXN1bWU7CiAJZGQtPmRldmljZV90ZXJtaW5hdGVfYWxsID0g
c3RtMzJfbWRtYV90ZXJtaW5hdGVfYWxsOwogCWRkLT5kZXZpY2Vfc3luY2hyb25pemUgPSBzdG0z
Ml9tZG1hX3N5bmNocm9uaXplOworCWRkLT5kZXNjcmlwdG9yX3JldXNlID0gdHJ1ZTsKKwogCWRk
LT5zcmNfYWRkcl93aWR0aHMgPSBCSVQoRE1BX1NMQVZFX0JVU1dJRFRIXzFfQllURSkgfAogCQlC
SVQoRE1BX1NMQVZFX0JVU1dJRFRIXzJfQllURVMpIHwKIAkJQklUKERNQV9TTEFWRV9CVVNXSURU
SF80X0JZVEVTKSB8Cg==
