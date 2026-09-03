Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32D736B910;
	Thu,  3 Sep 2026 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452967; cv=none; b=UZnC2oN/0Eyw/9+km8RslAGwCi1/04i6mmqEWgAX3A+yPN76adLPbG1e/yBzVda0USDmjnr8dESuG8p8Kg7rbGweFa7YUTFvgU8oFl2BGDFetxD5Yf2rDsIGAPromco5BtEl1oDQ3/DKI7aeK9E7iM8vYS+HXrXw+NNODa/aM+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452967; c=relaxed/simple;
	bh=URwc2WaXEk7sHvA8iTN/N7OCzQa7/xrni0fWLoz0LPQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IxAbubAc6HeXtaa8Fapm85j19ztHwVxyZ4+oYJZ5NZK/y9RsD7Ef9pPHPsupCRkcFFVaVGcINXZG02kirh3NkWvob7IE4uIZ1jy/9zJRXRdDMjgemx4zjfpSOsfdKD/qATQsC76GkUbJwim6AOdsATI/PWhqQP8tjsvgKJXGWCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owWrTvcH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owWrTvcH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5391F000E9;
	Thu,  3 Sep 2026 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788452966;
	bh=cfSjg9mYPeipAFTfWafkpUPGHsGkJcChBkU88AONxrA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=owWrTvcHaaMVBQz0yIU2NpcrGuguWiwBZTGUVFQ0ZFUSnmfTGWIGq+p9biUqiODWH
	 cZ44Uz+/THd7Vv4jmtP3GNtw/0YSAyrEdRMWDNkvSx6hX6McW7Sjiw3TJVRweiqqGF
	 74AyXYJiBbR/g/Dca2Exuh+HmHvAhOFPpLM5Zio9sIDWZmgYgLKTFEYPh2D4j9O8kA
	 obatEXDz6FjrSxl+xiAXA2oTzqaQvNUm1dwWhw+kV0B5rVqvIBGGnIn9WCWkRbOq/W
	 w2PPc0DHEsby3+zbGlIU7r4qsgW0cC1imIlhg4E6K6GWpBnconCjSQF4QeNMAjTLXK
	 /mZWznQ4oINzA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20260727-k3-pdma-fix-drcmr-base-v2-1-afba55cba1f3@linux.spacemit.com>
References: <20260727-k3-pdma-fix-drcmr-base-v2-1-afba55cba1f3@linux.spacemit.com>
Subject: Re: [PATCH v2] dmaengine: mmp_pdma: fix wrong extended DRCMR base
 for SpacemiT K3
Message-Id: <178845296259.1679748.15919618755814250880.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 21:59:22 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 27 Jul 2026 01:26:15 -0700, Troy Mitchell wrote:
> The extended DRCMR window on SpacemiT K3 starts at 0x1100. Commit
> 6587b8661a0b ("dmaengine: mmp_pdma: add SpacemiT K3 support") incorrectly
> set it to 0x1000, causing DRCMR accesses for request IDs >= 64 to target
> offsets 0x100 too low.
> 
> The 0x1100 base has been verified on K3 silicon using real SPI and QSPI
> DMA transactions. The K3 DMA documentation [1] was updated on June 24,
> 2026, to reflect the corrected register addresses.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mmp_pdma: fix wrong extended DRCMR base for SpacemiT K3
      commit: d1fc569fcbc7be6de06b034cf954a95e30ca1fb2

Best regards,
-- 
~Vinod


