Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E5C43635E;
	Mon, 20 Jul 2026 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562526; cv=none; b=R0B1tWH1PsMK6c9GwGKMM/FS5yZKjZrShYu3czQ9DTSIszJmvEaQlklmP8bD/KdFzEtepAEX/9u6c1bz0s8RSAtWNCK6J7gXpmaNaEUP96F0jRMs0CIvyEAsl4YYdtaOrlpgfW/7WWW/1GSX/obQPwJDtk8r/3DTv8n34R+F3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562526; c=relaxed/simple;
	bh=9LvXg3NTnDovSEqqSDs2B84zr+vch0I1EbPHoRUNT6Q=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=lxkid8om4lciORwpWYf/7gI/NXxXAX+T1OoGD3oPWk+MAdyOq+IVf6Vxj1QQ6euB3mn4f5PEbN7DyCamVB1TunzrJO2TKwxOOkw/hnelelXixzjky2Q0x2kImTn2vTAw35MJc7o4ZL1BlTgs5Vwd6uPtgeeDXLesX94R/JGYXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=H21ddfXj; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="H21ddfXj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=0MmTFb5IeLYk/uPJvB6eLPxq0htiQA+VXG+/m6z1eqY=; b=H21ddfXjTuSDuQN/TbAieTgl35
	dpDZrvChgsJFLWaTpC6XMgDkxmEqo9ceZjnnecM54/VbrwkQYzCYnCwcku8DKT5RJVe6DCbWdFrXj
	Vi9EUpqMXqlGQF7c7Fv2v3PoDGLflWHn4PZQiaY6QFP8Oss/tVK/NvJHA6Iivik/ts0J/0PLQieLI
	wPOe3kCTufc7r0Hgz0IgPdDCP6LwVzpX0ioYSH+P2zQ8BH8ORwrbu/Vj6i3F3dfJEvnhaSXv88XCq
	5J5DN8AkPKFoaJEuP8th2qrqp0XprmK1tGIa6Wf/a39fVljycCWpK4+yrLQcT25nvdoIqwSoY/KKi
	7Qif5LrQ==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1wlqEQ-0000000B5qN-2T2P;
	Mon, 20 Jul 2026 09:48:39 -0600
Message-ID: <fdb895ea-0c82-4569-b842-3f326a262059@deltatee.com>
Date: Mon, 20 Jul 2026 09:48:37 -0600
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hao-Qun Huang <alvinhuang0603@gmail.com>,
 Kelvin Cao <kelvin.cao@microchip.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 George Ge <george.ge@microchip.com>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260718223257.5662.alvinhuang0603@gmail.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20260718223257.5662.alvinhuang0603@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: alvinhuang0603@gmail.com, kelvin.cao@microchip.com, vkoul@kernel.org, Frank.Li@kernel.org, george.ge@microchip.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH] dmaengine: switchtec-dma: preserve results for
 out-of-order completions
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-07-18 08:32, Hao-Qun Huang wrote:
> Switchtec completion entries can arrive out of submission order, and the
> driver handles that by marking the descriptor complete and deferring its
> callback until the ring tail catches up.  The problem is that the
> per-transfer result (status and residue) is only kept in a stack variable
> while the completion entry is being read.  Once the tail gap closes,
> cleanup retires the descriptor at the tail along with any already
> completed descriptors behind it, and hands the same stack result to every
> one of them.
> 
> So a transfer that failed out of order can be reported as successful (or
> the other way round) depending on which completion happened to close the
> gap, and the residue can end up coming from the wrong transfer too.
> 
> Keep the result in each descriptor instead of on the stack, and pass the
> descriptor's own saved result when it is retired.  Cookie ordering, the
> CID-to-descriptor mapping and the completion locking are unchanged; only
> the result handed to each callback is corrected.
> 
> Fixes: 30eba9df76ad ("dmaengine: switchtec-dma: Implement hardware initialization and cleanup")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
This appears correct to me:

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Thanks!

Logan
