Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858564CCDC5;
	Thu,  3 Sep 2026 22:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788475588; cv=none; b=p8t2+8zgO6BR88m8JVNM0Y7N+yjWYX2P6XB4K7UzBtjL3WCo7WyJdp7niZO4Az/JMctAcqNr8l6e6A5vnK2VkwrUKfriAJgDUpCPp4irklN37s7M0I7ZKJGTOETEkviSu3YfWZJHcRnZit/faysDt1rk70Uz16spJBlerlpSTSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788475588; c=relaxed/simple;
	bh=Osfa2/i2MjNGwKk3eYRFLu4ZDphgQqJ8O+y42+KT3+c=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=B1LlqX22JPODKJHYDnn/TLNIp1lSqjGhQujNMHuKIli7XJkEL9X8K4WAmy+TP2R6s5qTojWjsmPtdEdwk9m2Oh2+cPAJbA9ZddWGRxI09Nxlto4Jd0T2HCJo3M8oQZ5tq6cwuW6tx0cVIAx1H6lLEITSF7lxQnP6Sfyb75nxU/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=YXLVP72D; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="YXLVP72D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=8RlMKyJi6ukLs57B3U2ORMf5T8tXXpsPJj5dExTE+1A=; b=YXLVP72DWhE/ep/ORzzd77MYec
	tOvQgYdMORuBhaRvSftflKp7p5A0OXrgy3ynEYjByK2C7cbaBmmae8U2kowmr4aMyVPT7O/U05u2R
	Ra218/6/gBFN+2tCghrTppWLf0vi/z5w7Je4jt90E2ewHoms616/CcxzQfxvcMvnAMWoZRD3HYOpb
	+KJM1PlCWqojaYYVEZK3URXUmd3yK0vwVSG3e0JDN2YEYnygeZWotjjLjpHVk7BRIlaGtM4rK/I4A
	IDuoOKKOn/m6XKkqEX5IF0C/L6YGgrEgSmytmniXT9yBsH23ZLI7f+fsmbsnOLQOJUZ9XuubeaptH
	6Cyvgaww==;
Received: from [104.157.31.28] (helo=[192.168.1.251])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1x2FVp-00000001i7U-15KW;
	Thu, 03 Sep 2026 16:02:26 -0600
Message-ID: <0ceac9d0-ed20-4387-bb82-472720d6b91a@deltatee.com>
Date: Thu, 3 Sep 2026 16:00:45 -0600
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ruizhe Zhou <zhouruizhe@resnics.com>, Vinod Koul <vkoul@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Frank Li <Frank.Li@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903115441.912500-1-zhouruizhe@resnics.com>
 <20260903115441.912500-3-zhouruizhe@resnics.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20260903115441.912500-3-zhouruizhe@resnics.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 104.157.31.28
X-SA-Exim-Rcpt-To: zhouruizhe@resnics.com, vkoul@kernel.org, Basavaraj.Natikar@amd.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, Frank.Li@kernel.org, zhang.lyra@gmail.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH 2/3] dmaengine: plx_dma: Remove obsolete 32-bit DMA mask
 fallback
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-09-03 5:54 a.m., Ruizhe Zhou wrote:
> The DMA API guarantees support for masks of 32 bits or wider and
> explicitly identifies retrying a 32-bit mask after a wider request as
> incorrect:
> https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities
> 
> Remove the obsolete fallback while retaining the error check so that a
> genuine DMA setup failure is still propagated and aborts initialization.
> 
> Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>

Makes sense to me, thanks.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
