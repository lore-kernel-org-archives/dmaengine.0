Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2220C3D1CB0;
	Mon, 27 Jul 2026 20:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184707; cv=none; b=dqZRP+CMyTfJiUc9f21fouO2WcHmHSNvQbz8pytpSphu4F/4Hbgz3BmGM6jm9b+YRVrb5p402gCLkqnPeWA39s3H+ute0juj/EuD+slv7ZKonVOMXpZb72TdSj/OC5xE6snFz6jw+AyogGaaw6MtZTzCXAHuSAIBbHQ5M7adry4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184707; c=relaxed/simple;
	bh=iYYAKquXngUX/Bn/V9jOfXJLKSpx2xYsrrimBddT5e4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=dKuehis6v0ALy/HVIItWCoc/H7nLlFTexo5QvUWItoQG5yeEzvzDZmcr6UpmTPaO1el+1Ae5DhuJAn6bc3bnAJG/jyot3mkA2KT5AAaNNRBbOwCBGb728cZG7ktOP0v+g0B0EAZp+Z4770P9a6EP1XKs6+AOdI3sGRgAnJbz8eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=L68PDOf6; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="L68PDOf6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=ir0QfOhBFNDekY8cYeaC0wYg4AXa2KCbOSKUPZvpaIs=; b=L68PDOf6bg7qHe6aWbSVYlYGqI
	dCGjNwE+rI8ZY6SgdzWCKh8ExuMBVCE6RCE3JmY+8UzxMiQUMYd+ajQkgShcNogXrn/NHdtNPnsCu
	Mrb7aFijGg32U5jVEx5xwJ1NmpqwR/dZPBb0VL3J5p7+GSIljiONQW5P6eET6d5rOjNGLG/IiET9/
	GTJjiHNk0RWmOrtwiIIE1VwQDZEl0lP/j5l8ibxo3lKwSZsO9iiWnuMjtqESahcLUmL27AvSb/dGK
	Jub04cP6PC6CSg2uga1gygiOuf1riNTxSwRezx8viiLF+ElkS+enwbSaUrJUwLZathFeWPiHECGor
	4NLn1lmQ==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1woS5g-000000006Zw-3Bb9;
	Mon, 27 Jul 2026 14:38:25 -0600
Message-ID: <5ae73ce5-1216-4012-abe0-aba9469ef089@deltatee.com>
Date: Mon, 27 Jul 2026 14:38:23 -0600
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Allen Pais <allen.lkml@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <f2aa736ef2d9422717ab798cd38bcc405eefa94b.1785183549.git.allen.lkml@gmail.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <f2aa736ef2d9422717ab798cd38bcc405eefa94b.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: allen.lkml@gmail.com, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, kees@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v2 28/64] dmaengine: plx_dma: use channel BH helpers
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-07-27 14:28, Allen Pais wrote:
> Replace the device tasklet with the per-channel BH helper so completion
> callbacks run via dma_chan_*_bh.
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

Looks good to me, thanks.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
