Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC9E4C1510;
	Tue, 15 Sep 2026 17:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493804; cv=none; b=uoQ8AndNPl+rYyzb8s8bRVOGrsRQjciMC/2cfLHhHT1Y9KNKTeP2591SpWbxU5CtFPs5wI3fu3e3hPY4qoB1thCjnASbqOX10g7LqzPH3rMRpoB/gU3DazwevWI4hP8CTvf0zo16lWwIhM7zBoayeVBkcf+5z4sNoZutn3E98aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493804; c=relaxed/simple;
	bh=EGXhQMKEWQpwwb3xiKs+hkQ/kw9FwqrsyrhTH5eFL8Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TmeJ/3bRb5oPCP+IRyOpsuYioP1IChxyk/nupYu6V6PRgeMiqPRogbO+xTGzLzE6wWI80iL3rG1OQvStNDULPu7QffIyCGxpCQyaeT/Wb9a8U+1r0H1GyWb148fB3DqQU0MiSbKj/u5wW4ipJpjFslCOfAMzD/OlNUazEr8xl/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+FIj/QT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+FIj/QT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805B81F00899;
	Tue, 15 Sep 2026 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493801;
	bh=eNdYLtqkkYOYhZILhgJtpsPyCqSCB9iavwqs+7Zh6X4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E+FIj/QTxbYp/EPrsbkp9l/bzj3x2w9m1YBe6bDrozc/qRfrSNjkiU2STXelySAZT
	 C7Z3nlA3Wxn1Strpyj/2FaA0LiLqDnXfEYdcd7MTCF4JKIR7sgd6+wGf3pKaVCTk9S
	 SDdB0aNDSH21yYfJtRNf6dKPv08Ug3wat+AINHRwJQHzojEVKMS4ve5dl4Uk7LAiyz
	 vQ8ZGO8Ixg9jx/cgZa785TlS010GM+8kXVRG0+v619CjuDIGaaI5rjxyAKHfflfXgJ
	 +ESNNGIFhUiYeT2ZeIW8STUC2XVteBNXZXH/PB1WPoaVAXwb9KSxDrqf8Db7WN90yv
	 lgmZWK/KGz7ZQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260915072608.57887-1-rosenp@gmail.com>
References: <20260915072608.57887-1-rosenp@gmail.com>
Subject: Re: [PATCHv4] dmaengine: bestcomm: gen_bd: fix out-of-bounds
 access in PSC parameter lookup
Message-Id: <178949380010.248239.15548932309609117056.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:40 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 15 Sep 2026 00:26:08 -0700, Rosen Penev wrote:
> The bcom_psc_params[] array has 6 entries (indices 0-5), but
> bcom_psc_gen_bd_rx_init() checked against MPC52xx_PSC_MAXNUM which can
> be 12 when CONFIG_PPC_MPC512x is set, allowing indices 6-11 to pass
> and read past the array. The tx init function had no bounds check at
> all.
> 
> A malformed device tree with a large cell-index could therefore trigger
> an out-of-bounds read. The garbage initiator and ipr values would then
> be used for MMIO writes via out_8(&bcom_eng->regs->ipr[...], ...),
> potentially causing out-of-bounds MMIO accesses.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bestcomm: gen_bd: fix out-of-bounds access in PSC parameter lookup
      commit: a8d1f582fae8231bd0cf66164ef140cd410382d4

Best regards,
-- 
~Vinod


