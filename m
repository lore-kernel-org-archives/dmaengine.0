Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E74376A1F;
	Mon, 27 Jul 2026 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186495; cv=none; b=QByIuhqbB9GjFtBQX6gVWWfm16uf+GlsSGrmMZYBY52zyams1FXXhCHz0sFV0p4UF9GWHzq2WPzalH8sdmkCqGJOUOtKtC7mvrpbbxaBbXAy281rXgPs/QZQ0ukKO/I5KSX+8fxZQx5FZNkpwDnbhZ0omjcSW2RNEwKHiq2tJQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186495; c=relaxed/simple;
	bh=3eH8YjGdqkylxy5CtuOHurkd7XUFmSc/D446vbDyUjc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=U9Zm+vNEiQSgioifN+ZwrsePUAa/fWhhhPWE3ZQyE8s/SFaxvCL55gkYn4p4elUJ/miga4iwpaQY1+UNzw3fqmGlw8UEid5RQ7g5EiJp2e9Qzyj3dRIGmT5iGnMns/HIF0O22Q1+YtHqgKB5uh5m2lEeHH32X4xEBHXLcgt7Z9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=ijNF+Ccs; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="ijNF+Ccs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=d3EmRGi7Q/4c4z88zkXCxe/GaP/TPUfudYyUne3VyP8=; b=ijNF+Ccs1L846T5LPpRU8fDSle
	InROM9XsgIpOxM6ZBEFREZICYRJ3NXblTf9L7Cc6V88OdTJncMlUfvcPOkVhvvvLy6GVB3DzlJSGq
	3vvzR7B1bJrjIKXQgGoQdv0ky9s9u0iC7FSVtr0KOs6Kb5pdIN2VO2NY4PJtn2BeuwWGnWwAvlWkY
	6aeGnCvf70Oe3sg3T+e+dXQSOLV3hX/PPj4WBh+hoI4OjEnNYuumApbGPQVm1Vv0JaaGuuiMP22Rn
	l+e0H3AF589BX/1AfALeIj3qs0gxhIwVVHma2MKHA/ItBbZ6FGUcXQu+9kYNLDdseYC0M2lB02ZKq
	H/nImdog==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1woSYW-00000000733-1w0N;
	Mon, 27 Jul 2026 15:08:13 -0600
Message-ID: <a64dd902-6626-4f2d-8c11-bf728366b484@deltatee.com>
Date: Mon, 27 Jul 2026 15:08:11 -0600
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
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 Kelvin Cao <kelvin.cao@microchip.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <5eb60739b22e88b9220179dc024186c19724db28.1785183549.git.allen.lkml@gmail.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <5eb60739b22e88b9220179dc024186c19724db28.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: allen.lkml@gmail.com, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, kees@kernel.org, kelvin.cao@microchip.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v2 64/64] dmaengine: switchtec: use channel BH helpers
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-07-27 14:39, Allen Pais wrote:
> Replace the per-channel descriptor completion tasklet with the shared
> dma_chan BH helpers. Client callbacks remain in softirq context while
> using the common scheduling and teardown mechanism.
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

This one also looks good to me, thanks.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
