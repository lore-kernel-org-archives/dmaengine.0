Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484051;
	b=ZbSO+1yEoP2i4OGrecVkcW388z3JDPkniXLUE/ydjSvcqnQCIykPZaYy4LRqp2WpgkZN
	 d2UDqpWCUrADRcEFI67xASvLnMgEjThUsYCqW/c7V3eNnbZRGEZfqaBhw5yoU+RqCmRGK
	 75a9tyoQjeFwbrTQjL1jVdMK7ifEG08tD+TJZpXz5LAdTLW8ETeIXHJpqqD6yg0QTygZC
	 EXX2ZWyIk02KnmpTirw8RGaIJ10IvFe1XZFhrkip7/Lslbo01vCFxtdxPtIk7IUIyVbEA
	 rwMXB0P1nWR76p1ws/a1rC81D6KeLYFaNKMk46zKTEMHKKWm6QPQK8t5tCz1Ij4f6ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484051;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=aEsK9vnGIWgdQWg/4/gp+ERqdPLdZK75eQSfT/gO9Pk=;
	b=PpGbyxp+KzJrgDGttXpHhJPQxJCzW2da48G/WoO9radxbHoxLfO2MwZD/Im4xuABI/m4
	 5H7T8Di77KtGC940Ya5oipEP5dF5h5U5qO7cQY8uKUHHU68QBo5+PGigM2vYSIQ+gBWeG
	 G4EnaqTUOykSBBpMhIEphrf1qD9Z8omvBNMRJehCrDjcat8qbtyow1oJOMPRfKUKleE3N
	 HKm7VUObMalOmkUZUlFzipUrHBUQq6IYa51yIcjFAs6NmaU8dsHNwbbQo+90UkQLI6k0F
	 o4hT7Rt4ZGcYLD9lfdwvSujuo20+lksJ2pDqLSQ1Ep0xjkRfUq8kksxx2HEhr+GaI/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RCnjv+vU;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9753C606A324;
	Tue, 20 Oct 2026 08:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9753C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RCnjv+vU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=aEsK9vnGIWgdQWg/4/gp+ERqdPLdZK75eQSfT/gO9Pk=; b=R
	Cnjv+vUw17RM25HbbvPqMuGddLQAMNXJ0irypFTfWPLOd6+HOf3gwWx8a2uP2SmB
	iDAziIByqccqzbaF9irRVvpqnnVhRrfSP0844asw+laXL975n8MmReJ8/wccS40t
	dwd/tu0cxmXnt80jgfrZdR4QRYqABLnulyXy8r/pSc=
Date: Tue, 20 Oct 2026 16:10:32 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Frank Li" <Frank.Li@kernel.org>, "Zhang Wei" <zw@zh-kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	"Fabio Estevam" <festevam@gmail.com>,
	"Linus Walleij" <linusw@kernel.org>,
	"H Hartley Sweeten" <hsweeten@visionengravers.com>,
	"Ryan Mallon" <rmallon@gmail.com>,
	"Mika Westerberg" <mika.westerberg@iki.fi>,
	"Ebony Zhu" <ebony.zhu@freescale.com>,
	"Kumar Gala" <galak@gate.crashing.org>,
	"Dan Williams" <djbw@kernel.org>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Zhangfei Gao" <zhangfei.gao@marvell.com>,
	"Arnd Bergmann" <arnd@arndb.de>, "Qiao Zhou" <zhouqiao@marvell.com>,
	"Leo Yan" <leoy@marvell.com>,
	"Lennert Buytenhek" <buytenh@marvell.com>,
	"Nicolas Pitre" <nico@marvell.com>,
	"Saeed Bishara" <saeed@marvell.com>,
	"Maciej Sosnowski" <maciej.sosnowski@intel.com>,
	"Shawn Guo" <shawn.guo@freescale.com>,
	"Srinidh Kasagar" <srinidhi.kasagar@stericsson.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re:Re: [PATCH 0/7] dmaengine: drain completion tasklets during
 teardown
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261020073620.224795-1-peng.fan@oss.nxp.com>
References: <20261020073620.224795-1-peng.fan@oss.nxp.com>
X-NTES-SC: AL_Qu2SAPiTvEAo5CabY+kcn08ShO49XMOyvfoi2YFTc+MEpyPT/CwnXV1dJHjX9MKlLySpjjK2QjZX0MN8TZd4HI2VUqoFvXudLFbzFGVQoQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <3d4b1cde.711e.1a1585cb34c.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bCgvCgCnV_34IddqIc9cAA--.879W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhgXUWrXIfhxlAAA3R
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgUGVuZywKCkF0IDIwMjYtMTAtMjAgMTU6MzY6MTksICJQZW5nIEZhbiAoT1NTKSIgPHBlbmcu
ZmFuQG9zcy5ueHAuY29tPiB3cm90ZToKPk9uIFN1biwgMTggT2N0IDIwMjYgMTI6MDc6MTYgKzA4
MDAgSmlhbGUgWWFvIDx5YW9qaWFsZTAyQDE2My5jb20+IHdyb3RlOgo+Cj4+IFNldmVyYWwgRE1B
ZW5naW5lIGRyaXZlcnMgZGVmZXIgaW50ZXJydXB0IGNvbXBsZXRpb24gcHJvY2Vzc2luZyB0bwo+
PiB0YXNrbGV0cywgYnV0IHJlbGVhc2UgY2hhbm5lbCByZXNvdXJjZXMgd2l0aG91dCBkcmFpbmlu
ZyB0YXNrbGV0cyB0aGF0Cj4+IHdlcmUgYWxyZWFkeSBxdWV1ZWQuIFN0b3BwaW5nIG9yIHJlbGVh
c2luZyBhbiBJUlEgcHJldmVudHMgbmV3IGhhcmQgSVJRCj4+IGhhbmRsZXJzLCBidXQgZG9lcyBu
b3Qgc3luY2hyb25pemUgdGhlIGRlZmVycmVkIHRhc2tsZXQuCj4+IAo+PiBEZXBlbmRpbmcgb24g
dGhlIGRyaXZlciwgYSBsYXRlIHRhc2tsZXQgY2FuIGFjY2VzcyBmcmVlZCBkZXNjcmlwdG9yCj4+
IHN0b3JhZ2Ugb3IgaW52b2tlIGEgY29tcGxldGlvbiBjYWxsYmFjayBhZnRlciBpdHMgY2xpZW50
IGRhdGEgaGFzIGJlZW4KPj4gcmVsZWFzZWQuIEVuc3VyZSBlYWNoIHByb2R1Y2VyIGlzIHN0b3Bw
ZWQgYmVmb3JlIGtpbGxpbmcgdGhlIHRhc2tsZXQgYW5kCj4+IGZyZWVpbmcgdGhlIHJlc291cmNl
cyBpdCBjYW4gYWNjZXNzLgo+PiAKPj4gRWFjaCBwYXRjaCBpcyBpbmRlcGVuZGVudCBhbmQga2Vl
cHMgdGhlIHN5bmNocm9uaXphdGlvbiBsb2NhbCB0byBvbmUKPj4gZHJpdmVyJ3MgY2hhbm5lbCBv
ciBkZXZpY2UgdGVhcmRvd24gcGF0aC4KPj4gCj4+IEppYWxlIFlhbyAoNyk6Cj4+ICAgZG1hZW5n
aW5lOiBlcDkzeHg6IGRyYWluIHRhc2tsZXQgYmVmb3JlIGZyZWVpbmcgY2hhbm5lbCByZXNvdXJj
ZXMKPj4gICBkbWFlbmdpbmU6IGZzbGRtYTogZHJhaW4gY2hhbm5lbCB0YXNrbGV0IGR1cmluZyBy
ZW1vdmFsCj4+ICAgZG1hZW5naW5lOiBtbXBfcGRtYTogZHJhaW4gY2hhbm5lbCB0YXNrbGV0cyBk
dXJpbmcgcmVtb3ZhbAo+PiAgIGRtYWVuZ2luZTogbW1wX3RkbWE6IHN5bmNocm9uaXplIHRhc2ts
ZXQgd2hlbiBmcmVlaW5nIGEgY2hhbm5lbAo+PiAgIGRtYWVuZ2luZTogbXZfeG9yOiBkcmFpbiBJ
UlEgdGFza2xldCBiZWZvcmUgZnJlZWluZyBjaGFubmVsIG1lbW9yeQo+PiAgIGRtYWVuZ2luZTog
bXhzLWRtYTogc3luY2hyb25pemUgdGFza2xldCB3aGVuIGZyZWVpbmcgYSBjaGFubmVsCj4+ICAg
ZG1hZW5naW5lOiBzdGVfZG1hNDA6IHN5bmNocm9uaXplIHRhc2tsZXQgd2hlbiByZWxlYXNpbmcg
YSBjaGFubmVsCj4+IAo+PiAgZHJpdmVycy9kbWEvZXA5M3h4X2RtYS5jIHwgNCArKystCj4+ICBk
cml2ZXJzL2RtYS9mc2xkbWEuYyAgICAgfCAxICsKPj4gIGRyaXZlcnMvZG1hL21tcF9wZG1hLmMg
ICB8IDQgKysrKwo+PiAgZHJpdmVycy9kbWEvbW1wX3RkbWEuYyAgIHwgMiArKwo+PiAgZHJpdmVy
cy9kbWEvbXZfeG9yLmMgICAgIHwgNiArKysrLS0KPj4gIGRyaXZlcnMvZG1hL214cy1kbWEuYyAg
ICB8IDEgKwo+PiAgZHJpdmVycy9kbWEvc3RlX2RtYTQwLmMgIHwgMiArKwo+Cj5Zb3UgbWlnaHQg
bmVlZCB0byBhZGQgYSBiaXQgbW9yZSBjb250ZXh0IG9uIHRoZSBpc3N1ZXMuCj4KPlRha2luZyBt
eHMtZG1hIGZvciBleGFtcGxlLCBpdCBpcyBub24tU01QIHByb2Nlc3Nvci4KPgo+VGhlIG5vcm1h
bCBjb21wbGV0aW9uIHBhdGggaXM6Cj4xLiBETUEgaGFyZGlycSBmaXJlcyAtPiBteHNfZG1hX2lu
dF9oYW5kbGVyKCkgLT4gdGFza2xldF9zY2hlZHVsZSgpIC0+IHJhaXNlcyBUQVNLTEVUX1NPRlRJ
UlEKPjIuIGlycV9leGl0KCkgLT4gc29mdGlycSBwcm9jZXNzaW5nIC0+IHRhc2tsZXRfYWN0aW9u
KCkgLT4gbXhzX2RtYV90YXNrbGV0KCkgcnVucwo+My4gUmV0dXJuIHRvIHByb2Nlc3MgY29udGV4
dAo+Cj5UaGUgdGFza2xldCBhbG1vc3QgYWx3YXlzIGNvbXBsZXRlcyBiZWZvcmUgcHJvY2VzcyBj
b250ZXh0IHJlc3VtZXMuCj5UaGUgb25seSB3YXkgdG8gaGl0IHRoZSByYWNlIG9uIFVQIGlzIGlm
IHNvZnRpcnEgcHJvY2Vzc2luZyBnZXRzIGRlZmVycmVkCj50byBrc29mdGlycWQsIGFuZCB0aGVu
Ogo+SW4gUFJFRU1QVF9SVCBjYXNlOiBUYXNrbGV0cyBiZWNvbWUgdGhyZWFkZWQgYW5kIGNhbiBp
bnRlcmxlYXZlLgo+SXMgdGhlcmUgYSBjaGFuY2UgdGhhdCBpbiBub24tUlQgY2FzZSwgY291bGQg
d2UgaGl0IGlzc3VlcyBvbiBVUCBwcm9jZXNzb3I/Cj4KPk9yIEkgbWF5IHVuZGVyc3RhbmQgd3Jv
bmc/CgpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBhbmFseXNpcy4KClRoZSBub3JtYWwgVVAvbm9u
LVJUIHBhdGggdXN1YWxseSBydW5zIHRoZSB0YXNrbGV0IGZyb20gaXJxX2V4aXQoKSwgYXMKeW91
IGRlc2NyaWJlZC4gSG93ZXZlciwgaWYgdGhlIERNQSBJUlEgcmFpc2VzIFRBU0tMRVRfU09GVElS
USBhZnRlciB0aGF0CnZlY3RvciBoYXMgYWxyZWFkeSBiZWVuIHByb2Nlc3NlZCBpbiB0aGUgY3Vy
cmVudCBzb2Z0aXJxIHBhc3MsCm5lZWRfcmVzY2hlZCgpIG9yIHRoZSBzb2Z0aXJxIHRpbWUvcmVz
dGFydCBsaW1pdHMgY2FuIGRlZmVyIGl0IHRvCmtzb2Z0aXJxZC4gUHJvY2VzcyBjb250ZXh0IG1h
eSB0aGVuIHJlbGVhc2UgdGhlIGNoYW5uZWwgYmVmb3JlIHRoZQp0YXNrbGV0IHJ1bnMuCgpBIHNp
bWlsYXIgdGVhcmRvd24gaXNzdWUgd2FzIGZpeGVkIGJ5IGNvbW1pdCAwY2E3OTk3OTM4NGYKKCJS
RE1BL2VyZG1hOiBGaXggQ0VRIHRhc2tsZXQgdXNlLWFmdGVyLWZyZWUgb24gcmVtb3ZhbCIpLiBm
cmVlX2lycSgpCnN5bmNocm9uaXplcyB0aGUgaGFyZCBJUlEgaGFuZGxlciwgYnV0IGRvZXMgbm90
IGRyYWluIGFuIGFscmVhZHkgcXVldWVkCnRhc2tsZXQuCgpGb3IgbXhzLWRtYSwgdGhlIGRlZmVy
cmVkIHRhc2tsZXQgbWF5IGludm9rZSB0aGUgY29tcGxldGlvbiBjYWxsYmFjawphZnRlciBpdHMg
Y2xpZW50IGRhdGEgaGFzIGJlZW4gcmVsZWFzZWQuIFRoZXJlZm9yZSB0aGlzIGNhbiBhbHNvIGhh
cHBlbgpvbiBVUC9ub24tUlQsIGFsdGhvdWdoIHRoZSB3aW5kb3cgaXMgbmFycm93LgoKPgo+UmVn
YXJkcwo+UGVuZwo+Cj4+ICA3IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4+IAo+PiAtLSAKPj4gMi4zNC4xCj4KPlNlbnQgdXNpbmcgaGttbCAoaHR0cHM6
Ly9naXRodWIuY29tL3NqcDM4L2hhY2tlcm1haWwpCgoKVGhhbmtzLApKaWFsZQo=
