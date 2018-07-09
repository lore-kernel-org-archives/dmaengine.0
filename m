Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [05/14] dmaengine: dma-jz4780: Add support for the JZ4740 SoC
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20180709171226.GK22377@vkoul-mobl>
Date: Mon, 9 Jul 2018 22:42:26 +0530
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <dmaengine.vger.kernel.org>

T24gMDMtMDctMTgsIDE0OjMyLCBQYXVsIENlcmN1ZWlsIHdyb3RlOgoKPiAgZW51bSBqel92ZXJz
aW9uIHsKPiArCUlEX0paNDc0MCwKPiAgCUlEX0paNDc3MCwKPiAgCUlEX0paNDc4MCwKPiAgfTsK
PiBAQCAtMjQ3LDYgKzI0OCw3IEBAIHN0YXRpYyB2b2lkIGp6NDc4MF9kbWFfZGVzY19mcmVlKHN0
cnVjdCB2aXJ0X2RtYV9kZXNjICp2ZGVzYykKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0IHVuc2ln
bmVkIGludCBqejQ3ODBfZG1hX29yZF9tYXhbXSA9IHsKPiArCVtJRF9KWjQ3NDBdID0gNSwKPiAg
CVtJRF9KWjQ3NzBdID0gNiwKPiAgCVtJRF9KWjQ3ODBdID0gNywKPiAgfTsKPiBAQCAtODAxLDEx
ICs4MDMsMTMgQEAgc3RhdGljIHN0cnVjdCBkbWFfY2hhbiAqano0NzgwX29mX2RtYV94bGF0ZShz
dHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzICpkbWFfc3BlYywKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0
IHVuc2lnbmVkIGludCBqejQ3ODBfZG1hX25iX2NoYW5uZWxzW10gPSB7Cj4gKwlbSURfSlo0NzQw
XSA9IDYsCj4gIAlbSURfSlo0NzcwXSA9IDYsCj4gIAlbSURfSlo0NzgwXSA9IDMyLAo+ICB9OwoK
SSBmZWVsIHRoZXNlIHNob3VsZCBiZSBkb25lIGF3YXkgd2l0aCBpZiB3ZSBkZXNjcmliZSBoYXJk
d2FyZSBpbiBEVAoKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGp6NDc4
MF9kbWFfZHRfbWF0Y2hbXSA9IHsKPiArCXsgLmNvbXBhdGlibGUgPSAiaW5nZW5pYyxqejQ3NDAt
ZG1hIiwgLmRhdGEgPSAodm9pZCAqKUlEX0paNDc0MCB9LAoKYWRkaW5nIC5jb21wYXRpYmxlIHNo
b3VsZCBiZSB0aGUgb25seSB0aGluZyByZXF1aXJlZCwgaWYgYXQgYWxsIGZvciB0aGlzCmFkZGl0
aW9uIDopCg==
