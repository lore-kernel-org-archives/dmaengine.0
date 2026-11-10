Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333052;
	b=iloAoXon0ZJCUst944k2l+qXqfEZO6zrQzzLWB+q/4EB1jHg2m/QMvTf+K8NfN2429fB
	 GhammlRLx1LoSugEkGpVQwPYlSglbd+xPPOtUNbGQJB32mUg38XTTtv46Fp9tIK1OdKxt
	 YOSFimiEu/91t+ze3eqkOTVvHNCMShhQVlNtV7SCtlOnaOWjut+5nhjgCgZi2N3B+6F9k
	 GrrN0YBAYbGK5vCel7/THwf768rKyhykbmb6w9Pqc44VXzyfnCN3GonAymLVJv/xCzj0q
	 fxHPfBDn8B5V8kbeLJSUB3cMi4/kTYhD8cjLvjrSM32Q2NmfxKE9uI6+adMCaMdgXrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333052;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:Subject:X-SA-Exim-Version:
	 X-SA-Exim-Scanned;
	bh=OhBmBB5csoRwUskFDo3bdowpIsJJII9UaiaDaNs2X5E=;
	b=Qr8hGz2H2X3AQdVNxqgvOErmnFdvvyExIr85AkBEbjwOp9L6lBzcPnftKUu0HbsZPof0
	 BKyJ6w37AWEptrAjAfzl5pO4uE8FI4xGQCM6Ac/j1+7aakigVTlYc+2kIVDTNJl4YxKR/
	 7Jxxr//BdFWZfzQN7eNzzWwNEbTvbZFOhLa8HOZJCz8m+POnmIiIGqDP0PUH/1c5KV0Ra
	 l4DjopGJPHNH1Wqb9LeXLJdBwlZaP8iQMWjDVUoaQ8itNN/5C5YMUHNPY9jQiLgsta5NS
	 jJHR63KAXdGLc3YrG28KcmFyrn17GsY2t3CjjyseSG4EI5c5SKu9+0Mtnd1voqMgrtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=JUudkuDA;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD65B606A323;
	Tue, 10 Nov 2026 17:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD65B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=JUudkuDA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=OhBmBB5csoRwUskFDo3bdowpIsJJII9UaiaDaNs2X5E=; b=JUudkuDAVtlFw1EnsYsjLhHAhG
	IyV35tZj3p7vLYnJEAJiPXH1DiWvDzDRgKCtpOu4nFObOrCq/0parJuG98XPw/Tf2MysTOBw5dcmI
	sAS2e5TBQBdRqaS/kpbVlDZsSLGfh3sBNObCa8Jf75rJGvL82ZL+s0vsv+avZ4LgwWmhtgQWBzssT
	o9bXbnfMXEGj+tbd4UUKs2bS7/xFNxxuGd2R9r+UMyiQh8Z8/WERLuB2VLQg2wrsf7bIr+IT8PTOw
	IpFb502Ee1aCW956bbBFyv80WHx3mmsXVgVAW4Am14wNkDRDMx6M7tb8Xnx2+2+SxoUbgd9ucwhgW
	sqjilA0A==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQpze-00000000oJB-0dMp;
	Tue, 10 Nov 2026 11:50:50 -0600
Message-ID: <dbe72187-4c12-4a8f-a63f-0c4238e50ec5@deltatee.com>
Date: Tue, 10 Nov 2026 11:50:49 -0600
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org,
 Kelvin Cao <kelvin.cao@microchip.com>
References: <20261110173137.623764-1-logang@deltatee.com>
 <20261110173137.623764-5-logang@deltatee.com>
 <sashiko-outbox-207513@kernel.org>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <sashiko-outbox-207513@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, kelvin.cao@microchip.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v4 4/4] dmaengine: switchtec-dma: add pmon sysfs
 attributes
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-11-10 11:47, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Does latency_selector_show() violate the sysfs one-value-per-file rule?
Strictly speaking yes, but we think the text printed is
self-documentation that's worth having here. If others feel strongly
against this we can revisit it.

Logan
