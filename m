Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74F317BCA;
	Fri,  8 May 2026 01:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778204194; cv=none; b=MakL0xouCv1ql5Sa7SE/oZrJJuBn0+nMjjZut3e6+h0lb4QOcEYGci/b0zgTP3nnOVVnPQSbOgDh1P4zQkajtdILegNkIU+7qIa4wX5yFHy3YJ/MlCYv5T7EupFTlEQMllHrFV8tw3jTlKvF4guI/P3XhRXyF+3d/e8TDh0IuzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778204194; c=relaxed/simple;
	bh=e0+0lja+Kzksa0cbDYWXWMbHJC7h8ozTJ8kJwijGG/Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=tidGHSiZc6JC9yJHplpm5ht8rnteU7x357fb5eY3v4nTj8+L6+tGWLdd1nEI/mhQu+YzQWrNqWwyLuJjNkfMnbSgvLCCYcaXuG+MMJU8w6wMIyJQQrSXtYkcPRSMYwrXUe4kQE5iJTzHuA9D9exVvnZm229qIfzu3wV+Y3D6zwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=mk2UKeSo; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="mk2UKeSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=e0+0lja+Kzksa0cbDYWXWMbHJC7h8ozTJ8kJwijGG/Y=; b=m
	k2UKeSoqQIBS+lHd0SLop6udm6z17TsAoG8R4yP9yFFJ5mlSxeeT5UwAeHPez2vc
	W8aAFHqBhDWiQo+jYdpSWe82ZT3cvaYN2//VV7mIKo/ooThnIx/P8t564pceTWUJ
	BJ3XGgnQHQf6YCaKpFJ1SodoUpoMj5SsarZZB23ChQ=
Received: from zhongling0719$126.com (
 [2409:8a1e:7359:c00:9929:af11:b280:fd4b] ) by ajax-webmail-wmsvr-41-118
 (Coremail) ; Fri, 8 May 2026 09:33:19 +0800 (CST)
Date: Fri, 8 May 2026 09:33:19 +0800 (CST)
From: dd  <zhongling0719@126.com>
To: "Frank Li" <Frank.li@nxp.com>
Cc: "Hongling Zeng" <zenghongling@kylinos.cn>,
	ludovic.desroches@microchip.com, vkoul@kernel.org,
	Frank.Li@kernel.org, djbw@kernel.org, nicolas.ferre@microchip.com,
	maciej.sosnowski@intel.com, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] dma: at_hdmac: Fix IRQ leak in at_dma_probe()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <afzY9B9lGrfWMWUh@lizhi-Precision-Tower-5810>
References: <20260507075750.14310-1-zenghongling@kylinos.cn>
 <afzY9B9lGrfWMWUh@lizhi-Precision-Tower-5810>
X-NTES-SC: AL_Qu2cCv6bvEEi7yeeYukfn0YbgOw2Wcewuv8j24dVc84Onjng2RwjVnlyLGDW3NK2FyynizqYbCJB1ONqZ5d2emH7VIvgfSN58zycY3r6nA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1a41b0d2.11d6.19e0537be23.Coremail.zhongling0719@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:dikvCgC338lgPf1ppy6DAA--.17082W
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoABBEmn9PWC81AAA3S
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKSGkgRnJhbmssCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKWW91J3JlIHJpZ2h0IHRoYXQg
aW4gdGhlIG5vcm1hbCBjYXNlIHBsYXRmb3JtX2dldF9pcnEoKSByZXR1cm5zIHRoZQoKc2FtZSB2
YWx1ZSBhcyAnaXJxJy4gSG93ZXZlciwgdGhpcyBwYXR0ZXJuIHRyaWdnZXJzIGEgc21hdGNoIHdh
cm5pbmc6CgrCoCDCoCDCoCDCoCDCoCDCoGRyaXZlcnMvZG1hL2F0X2hkbWFjLmM6MjExMCBhdF9k
bWFfcHJvYmUoKQoKwqAgwqAgwqAgwqAgwqAgwqB3YXJuOiAnaXJxJyBmcm9tIHJlcXVlc3RfaXJx
KCkgbm90IHJlbGVhc2VkIG9uIGxpbmVzOiAyMTEwLgoKU3RhdGljIGFuYWx5c2lzIHRvb2xzIGNh
bm5vdCBndWFyYW50ZWUgdGhhdCBwbGF0Zm9ybV9nZXRfaXJxKCkgd2lsbAoKYWx3YXlzIG1hdGNo
IHRoZSBwcmV2aW91c2x5IHJlcXVlc3RlZCBJUlEsIHNvIHRoZXkgdHJlYXQgaXQgYXMgYQoKcG90
ZW50aWFsIHJlc291cmNlIGxlYWsuCgpVc2luZyB0aGUgc3RvcmVkICdpcnEnIG1ha2VzIHRoZSBl
cnJvciBwYXRoIHVuYW1iaWd1b3VzIGFuZCBzaWxlbmNlcwoKdGhlIHdhcm5pbmcuIFRoZXJlZm9y
ZSBJIHRoaW5rIGl0IHF1YWxpZmllcyBhcyBhIHNtYWxsIGJ1ZyBmaXggcmF0aGVyCgp0aGFuIGp1
c3QgY2xlYW51cC4KClRoYW5rcywKCgoKQXQgMjAyNi0wNS0wOCAwMjoyNDo1MiwgIkZyYW5rIExp
IiA8RnJhbmsubGlAbnhwLmNvbT4gd3JvdGU6Cj5PbiBUaHUsIE1heSAwNywgMjAyNiBhdCAwMzo1
Nzo1MFBNICswODAwLCBIb25nbGluZyBaZW5nIHdyb3RlOgo+PiBXaGVuIHJlcXVlc3RfaXJxKCkg
c3VjY2VlZHMgYnV0IGEgbGF0ZXIgZXJyb3Igb2NjdXJzIGluIGF0X2RtYV9wcm9iZSgpLAo+PiB0
aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCBhdHRlbXB0cyB0byBmcmVlIHRoZSBJUlEgYnkgY2FsbGlu
Zwo+PiBwbGF0Zm9ybV9nZXRfaXJxKCkgYWdhaW4gaW5zdGVhZCBvZiB1c2luZyB0aGUgYWxyZWFk
eSBzdG9yZWQgSVJRIG51bWJlcgo+PiBpbiB0aGUgbG9jYWwgdmFyaWFibGUgJ2lycScuCj4+Cj4+
IEZpeCB0aGlzIGJ5IHVzaW5nIHRoZSBzdG9yZWQgJ2lycScgdmFyaWFibGUgZGlyZWN0bHkgaW4g
ZnJlZV9pcnEoKS4KPj4KPj4gRml4ZXM6IGRjNzhiYWEyYjkwYjIgKCJkbWFlbmdpbmU6IEF0bWVs
IEhETUFDIGRyaXZlciIpCj4KPkFueSBhY3R1YWwgcHJvYmxlbSBkbyB5b3UgbWVldD8gc3VwcG9z
ZSBpdCBzaG91bGQgYmUgdGhlIHNhbWUgYXMgJ2lycScuCj4KPm9mIGNvdXJzZSB1c2luZyB2YXJp
YmxlIGlycSBpcyBjb3JyZWN0LiBidXQgdGhpcyBwYXRjaCBzaG91bGQgYmVsb25nIGNvZGUKPmNs
ZWFudXAsIG5vdCBmaXguCj4KPkZyYW5rCj4KPj4gU2lnbmVkLW9mZi1ieTogSG9uZ2xpbmcgWmVu
ZyA8emVuZ2hvbmdsaW5nQGt5bGlub3MuY24+Cj4+IC0tLQo+PiAgZHJpdmVycy9kbWEvYXRfaGRt
YWMuYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEvYXRfaGRtYWMuYyBiL2RyaXZlcnMv
ZG1hL2F0X2hkbWFjLmMKPj4gaW5kZXggZTViMzBhNTdjNDc3Li4yYTg2MDY3OWI5ZTEgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvZG1hL2F0X2hkbWFjLmMKPj4gKysrIGIvZHJpdmVycy9kbWEvYXRf
aGRtYWMuYwo+PiBAQCAtMjEwOSw3ICsyMTA5LDcgQEAgc3RhdGljIGludCBfX2luaXQgYXRfZG1h
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICBlcnJfbWVtc2V0X3Bvb2xf
Y3JlYXRlOgo+PiAgCWRtYV9wb29sX2Rlc3Ryb3koYXRkbWEtPmxsaV9wb29sKTsKPj4gIGVycl9k
ZXNjX3Bvb2xfY3JlYXRlOgo+PiAtCWZyZWVfaXJxKHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCks
IGF0ZG1hKTsKPj4gKwlmcmVlX2lycShpcnEsIGF0ZG1hKTsKPj4gIGVycl9pcnE6Cj4+ICAJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGF0ZG1hLT5jbGspOwo+PiAgCXJldHVybiBlcnI7Cj4+IC0tCj4+
IDIuMjUuMQo+Pgo=
