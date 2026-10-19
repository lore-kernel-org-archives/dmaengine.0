Received: from mail-m103131191189.xmail.ntesmail.com (mail-m103131191189.xmail.ntesmail.com [103.131.191.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B30A538414;
	Mon, 19 Oct 2026 14:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.131.191.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418667; cv=none; b=S/5AN4l7+wF06GrKfqBU5jX35eQr7YXumQ/b66/erKLIZfhXT9jus2tk/AYCLofEdCxhlSu//1XOXNEoQQow252G6COHWoPMKr4Yu1UY7K+iyGDPheuJHpIf8ZqyLjdFpUTRL1ymp3hUYbdlRmb8S3HUIIfBrKdU6q3x480opmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418667; c=relaxed/simple;
	bh=YYQ7V0OzFhzS70K302veKIUli5EAqGZVk4L9LILx1DQ=;
	h=Content-Type:Message-ID:To:Cc:Subject:MIME-Version:From:Date; b=M+Gly2ydMLlXDiEbw0yXKPysYenRB7iS2PNvf8Fk8+wv03mZbETvRtRgj+HcsXa7ClvMFH1u6yoBAZ6vlIroeQR99i0L1m65LIicq3iUaUyon8SU3RnLWFzhPWPqYCe7xkjN/MM3pW9xTituuf0DeCp5U5AUtw7A3aNNMJMvx3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hdu.edu.cn; spf=pass smtp.mailfrom=hdu.edu.cn; dkim=pass (1024-bit key) header.d=hdu.edu.cn header.i=@hdu.edu.cn header.b=Wn2N2sPO; arc=none smtp.client-ip=103.131.191.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hdu.edu.cn header.i=@hdu.edu.cn header.b="Wn2N2sPO"
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AMgApAB7LHAmvchq*LUlC4qv.1.1792418652126.Hmail.252270051@hdu.edu.cn>
To: dave.jiang@intel.com
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?ZG1hZW5naW5lOiBpb2F0OiBwb3NzaWJsZSB1c2UtYWZ0ZXItZnJlZSBvbiBwcm9iZSBmYWlsdXJl?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com web
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 252270051@hdu.edu.cn( [183.157.177.89] ) by ajax-webmail ( [127.0.0.1] ) ; Mon, 19 Oct 2026 22:04:12 +0800 (GMT+08:00)
From: LI xiao <lixiao0@hdu.edu.cn>
Date: Mon, 19 Oct 2026 22:04:12 +0800 (GMT+08:00)
X-HM-Tid: 0aa15473c4ead458kusy3cb99d11c338
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQh5NVh8aT0xNTEMZGE4ZGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSk5MVUpMTFVDQllXWRYaDxIVHRRZQVlPS0hVSk
	tISkxDSlVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=Wn2N2sPOYDO3HmeX6dKGigItwcX6HRiQQ1cST8sC0IpNvR+v3tYBHaXLhHnUfR+3EwE9Sk13op8t122ZhQw2EAc/95zqJEfglwFOO7r6JfY/6UC1lCl7N/ZuVw4PGDKrnjv8oSy16ryOUbi4PF3PYcrJtzkWxvpc3+yANkyH6wo=; s=default; c=relaxed/relaxed; d=hdu.edu.cn; v=1;
	bh=YYQ7V0OzFhzS70K302veKIUli5EAqGZVk4L9LILx1DQ=;
	h=date:mime-version:subject:message-id:from;

SGVsbG8sCgpJIGZvdW5kIGEgcG9zc2libGUgSVJRIGxpZmV0aW1lIHJhY2UgaW4gdGhlIEludGVs
IEkvT0FUIERNQSBkcml2ZXIuCgpJIHJldmlld2VkIHRoZSByZWxldmFudCBjb2RlIGluIExpbnV4
IHY3LjMgYXQgY29tbWl0IGMwM2MxYTE0NTA3ZGZhZjhiODU2YzI2MDhmOWFjMjE2MDIxZmMyMjIu
IEluIGRyaXZlcnMvZG1hL2lvYXQvaW5pdC5jLCBpb2F0X2RtYV9zZXR1cF9pbnRlcnJ1cHRzKCkg
cmVnaXN0ZXJzIElSUSBoYW5kbGVycyB1c2luZyBkZXZtX3JlcXVlc3RfaXJxKCkuIEluIE1TSS1Y
IG1vZGUsIHRoZSBoYW5kbGVyIHJlY2VpdmVzIGFuIGlvYXRkbWFfY2hhbiBwb2ludGVyLCB3aGls
ZSBpbiBNU0kvSU5UeCBtb2RlLCB0aGUgaGFuZGxlciByZWNlaXZlcyBhbiBpb2F0ZG1hX2Rldmlj
ZSBwb2ludGVyLgoKSWYgaW5pdGlhbGl6YXRpb24gZmFpbHMgYWZ0ZXIgdGhlIElSUSBoYW5kbGVy
cyBoYXZlIGJlZW4gcmVnaXN0ZXJlZCwgdGhlIGVycl9kaXNhYmxlX2ludGVycnVwdHMgcGF0aCBk
aXNhYmxlcyBkZXZpY2Utc2lkZSBpbnRlcnJ1cHRzIGFuZCByZXR1cm5zLiBpb2F0X3BjaV9wcm9i
ZSgpIHRoZW4gZnJlZXMgdGhlIGNoYW5uZWwgb2JqZWN0cyByZWZlcmVuY2VkIGJ5IGRldmljZS0+
aWR4W10gYW5kIHRoZSBkZXZpY2UgaXRzZWxmIGJlZm9yZSByZXR1cm5pbmcgYW4gZXJyb3IuIFNp
bmNlIG1hbmFnZWQgSVJRIGNsZWFudXAgb2NjdXJzIGFmdGVyIHRoZSBwcm9iZSBjYWxsYmFjayBy
ZXR1cm5zLCBhbiBJUlEgaGFuZGxlciB0aGF0IGlzIHN0aWxsIHJ1bm5pbmcgY291bGQgYWNjZXNz
IGEgZnJlZWQgY2hhbm5lbCBvciBkZXZpY2Ugb2JqZWN0IGJlZm9yZSB0aGUgY29ycmVzcG9uZGlu
ZyBJUlEgaXMgcmVsZWFzZWQuCgpJIHRlc3RlZCB0aGUgc3VzcGVjdGVkIGxpZmV0aW1lIG9yZGVy
aW5nIHVzaW5nIGEgdGVzdC1vbmx5IGtlcm5lbCBtb2R1bGUgaW4gYSBtYWlubGluZSB2Ny4zIEtB
U0FOLWVuYWJsZWQgUUVNVSBndWVzdC4gQSB0ZXN0IGt0aHJlYWQgcmV0YWluZWQgYSBwb2ludGVy
IHRvIGEgc2ltdWxhdGVkIGRldmljZSBvYmplY3QgYW5kIHdhaXRlZCB3aGlsZSB0aGUgY2xlYW51
cCBwYXRoIGRpc2FibGVkIHNpbXVsYXRlZCBpbnRlcnJ1cHRzIGFuZCBmcmVlZCB0aGUgZGV2aWNl
LiBBZnRlciB0aGUga3RocmVhZCByZXN1bWVkIGFuZCBhY2Nlc3NlZCB0aGUgcmV0YWluZWQgcG9p
bnRlciwgS0FTQU4gcmVwb3J0ZWQ6CgpCVUc6IEtBU0FOOiBzbGFiLXVzZS1hZnRlci1mcmVlIGlu
IGlvYXRfaXJxX2hhbmRsZXJfcmVwcm8rMHg2OC8weDcwIFtpb2F0X3Byb2JlX3JhY2VfcmVwcm9d
ClJlYWQgb2Ygc2l6ZSA4IGF0IGFkZHIgZmYxMTAwMDEwMjVjMDM4OCBieSB0YXNrIGlvYXQtaXJx
LXRlc3QvNzcKClRoaXMgaXMgYSBjb250cm9sbGVkIHNpbXVsYXRpb24gb2YgdGhlIGxpZmV0aW1l
IG9yZGVyaW5nLCBub3QgYSByZXByb2R1Y3Rpb24gdGhyb3VnaCB0aGUgYWN0dWFsIEkvT0FUIGRy
aXZlciBvciBoYXJkd2FyZS4gVGhlIHJlcG9ydGVkIGFjY2VzcyBvY2N1cnJlZCBpbiB0aGUgdGVz
dCBtb2R1bGUncyBoYW5kbGVyLCBub3QgdGhlIGRyaXZlcidzIGFjdHVhbCBJUlEgaGFuZGxlci4g
UUVNVSA2LjIgZG9lcyBub3QgcHJvdmlkZSBhbiBJL09BVCBkZXZpY2UgbW9kZWwsIHNvIEkgY291
bGQgbm90IGV4ZXJjaXNlIHRoZSByZWFsIHByb2JlLWZhaWx1cmUgcGF0aC4KCkNvdWxkIHlvdSBw
bGVhc2UgYXNzZXNzIHdoZXRoZXIgdGhpcyBpcyBhIGJ1Zz8KCkJlc3QgcmVnYXJkcywKTEkgWGlh
bw==
