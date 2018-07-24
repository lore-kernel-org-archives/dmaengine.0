Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,07/18] dmaengine: dma-jz4780: Add support for the JZ4770 SoC
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20180724133229.GG3661@vkoul-mobl>
Date: Tue, 24 Jul 2018 19:02:29 +0530
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <dmaengine.vger.kernel.org>

T24gMjEtMDctMTgsIDEzOjA2LCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+ICtzdGF0aWMgaW5saW5l
IHZvaWQgano0NzgwX2RtYV9jaGFuX2VuYWJsZShzdHJ1Y3Qgano0NzgwX2RtYV9kZXYgKmp6ZG1h
LAo+ICsJdW5zaWduZWQgaW50IGNobikKCnJpZ2h0IGp1c3RpZmllZCBhbmQgYWxpZ25lZCB3aXRo
IHByZWNlZGluZyBwbGVhc2UuIFdoaWxlIGFkZGluZyBuZXcKY29kZSB0byBhIGV4aXN0aW5nIGRy
aXZlciBpdCBpcyBhIGdvb2QgaWRlYSB0byBjb25mb3JtIHRvIGV4aXN0aW5nIHN0eWxlCgo+ICt7
Cj4gKwlpZiAoanpkbWEtPnZlcnNpb24gPT0gSURfSlo0NzcwKQo+ICsJCWp6NDc4MF9kbWFfY3Ry
bF93cml0ZWwoanpkbWEsIEpaX0RNQV9SRUdfRENLRVMsIEJJVChjaG4pKTsKPiArfQo+ICsKPiAr
c3RhdGljIGlubGluZSB2b2lkIGp6NDc4MF9kbWFfY2hhbl9kaXNhYmxlKHN0cnVjdCBqejQ3ODBf
ZG1hX2RldiAqanpkbWEsCj4gKwl1bnNpZ25lZCBpbnQgY2huKQo+ICt7Cj4gKwlpZiAoanpkbWEt
PnZlcnNpb24gPT0gSURfSlo0NzcwKQo+ICsJCWp6NDc4MF9kbWFfY3RybF93cml0ZWwoanpkbWEs
IEpaX0RNQV9SRUdfRENLRUMsIEJJVChjaG4pKTsKCnNvIGlmIGFub3RoZXIgdmVyc2lvbiBoYXMg
dGhpcyBmZWF0dXJlIHdlIHdvdWxkIGRvOgogICAgICAgIGlmIChqemRtYS0+dmVyc2lvbiA9PSBJ
RF9KWjQ3NzApIHx8CiAgICAgICAgICAgICAgICBpZiAoanpkbWEtPnZlcnNpb24gPT0gSURfSlpY
WFhYKSkKCmFuZCBzbyBvbi4uIHdoeSBub3QgYWRkIGEgdmFsdWUsIGNsa19lbmFibGUgaW4gdGhl
IGRlc2NyaXB0aW9uIGFuZCB1c2UKdGhhdC4gRm9yIGVhY2ggY29udHJvbGxlciBpdCBpcyBzZXQg
dG8gdHJ1ZSBvciBmYWxzZQo=
