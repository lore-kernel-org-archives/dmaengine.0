Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169085;
	b=NYPZEDMv3sqV3PFQCkLk/pq6TmZ57Al6uFNpkrnlIz3gop47tPxd+y1aPmgCzqBUSxF7
	 hBExi4XrgwgM9qNNE1C92KTLTqWZTQ3fAdrvJmgXLFFMEYHz9UHaXLMynVkhELzaRHkxe
	 lyv2Kzxvus/ZYjfZBn9uQED6Pira96F6hwn+j6hRt0k0H9hOVgBS5O414u2JfVANltRjb
	 xJQuxgih2vTMqawb6hFN/GtY2LI3BcyCkBHMkoXwlo3FJ4ZRGB101Aj/0IwNXoptKomgA
	 dHTDuuUDYsP2H0AWtfpPEaa7ihQe0XOgEvTKcSZugZ9EbUQmQ/UzbrTQss9MkqBOiyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169085;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=Z6BUVo3fWGVpmZK7fHFe9RzImtGRbCFMl/2Ws5mJSkM=;
	b=LxKxDqc7oYqzUrOcwSHmU3fBmKXeaP9LsWLPnYXZvyIlFU74YafeB8Bx8sAnD52g2DlQ
	 OcUk04cDSQtmT7kkdZS6NVuhia99JgThw4ndq2H619HxkfjDmaSRfE79Tks9lq8fr6KVG
	 BzRNzT0MWfuS0K75p1zSI9NQzjvaV900f0AhTdtkGMvpF6P3YHvTYBDajILNXa3bhY9LH
	 RNd4eiktrUD9UhdO293nR8gEeBbpTttqIWfWiR8L33eVNvdXEMJEwGaQYDEb5s7MgEgx6
	 hOtsY+IcIO0YmRGSb2t/qX8f0cXcbQ1czadJfylD+7LPVl+zX6eK0ihqXkTe37gQggw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qq/6oCi/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FB3606A338;
	Fri, 20 Nov 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qq/6oCi/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA341F000D4;
	Fri, 20 Nov 2026 10:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169085;
	bh=Z6BUVo3fWGVpmZK7fHFe9RzImtGRbCFMl/2Ws5mJSkM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Qq/6oCi/8WIMYs2tV5aEnK8tGO7+Are/+wKcxEP+3S+LaKRE9gaJT5qBzl09mWAoR
	 xT3sTcXGpGD6uyMZa6G9SVRv4gb7d5MXevoyn1eEZrUqCm1zfO7cgTtOF7HNGweQ4v
	 Z2m3pPmi1GFJVcTzb9MI7xJL53rAdo+54dxhnt3CYEK7cieNJx9qDPymHY6Pm8/3je
	 L1sAkqCtXM9WYI1sPFWHwn1leYoQLaoxFCMWhjWojwo0VuRwA6f3VrCz5xhDKTBEsX
	 D5Vp4NN5E44pf1uXo/OWfuYxfWqRtQNq0/txb+lHhYR29WEtweR5uncYM4E4hEkxrL
	 xJJ+ZQWyrJz8g==
From: Vinod Koul <vkoul@kernel.org>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, Yi Sun <yi.sun@intel.com>, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@kernel.org>, 
 dmaengine@vger.kernel.org
In-Reply-To: <20260911225737.11411-1-kmehltretter@gmail.com>
References: <20260911225737.11411-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] Documentation: ABI: sysfs-driver-dma-idxd: Fix the
 kernel version 6.20.0
Message-Id: <179516908288.54365.16124886370434630919.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:34:42 +0530
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sat, 12 Sep 2026 00:57:37 +0200, Karl Mehltretter wrote:
> There is no kernel 6.20: the release after 6.19 was 7.0. The entry came
> in with commit 8308510b9365 ("dmaengine: idxd: Expose DSA3.0
> capabilities through sysfs"), first released in v7.0-rc1. Say 7.0.
> 
> 

Applied, thanks!

[1/1] Documentation: ABI: sysfs-driver-dma-idxd: Fix the kernel version 6.20.0
      commit: 6f85b686fce9dd00202f5c687ab836682b3bdaa7

Best regards,
-- 
~Vinod


