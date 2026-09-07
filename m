Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C394471CF0
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789373; cv=none; b=uWa1XPn7aO95BHIjsKY3m4qmbYQdjcp55vsX7p8hiNkYDJ//d+5TUikFRZtTeVzH5mTnlftO/ihnL7Hs5U5RDb3hClFlFtZgcXE/4l9nZK2KOV/JhsvU3YTh9A+SXC6F4pc1jrUsInfGxNGgMSo/EbYjCItq1/jEiCenanlPvKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789373; c=relaxed/simple;
	bh=JbHDHxEWwOTtgJ/r+8mc5ipR7uR2tTkBekrWAq1f5Fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VaWh3v9CqLQEI+LBPIH5VELn2RwRDFAWlDhWIXB4xB6497/2VQfe5XbHtJa4Ep9ecUcivNOWFFgJu9M3lfdRo0UECWyMkxe0vVlA4hT8sDHYsTcJs5ztaufDswkQV/oNDmcHDglcj8+yd5x2r58fxvp3ErmDYN3N99W/8eR+hTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P12Rl6Mx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P12Rl6Mx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902C21F00A3D;
	Mon,  7 Sep 2026 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788789371;
	bh=BkeoHVauSxyQE8+i/CQXjQB7FYUt7PHqUAvENI33HJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P12Rl6MxFTdWrxK94ABDfWPF4m2+Sd+1Dq83iDehf+gbAz8kYItP3zmUlDrYjy8kx
	 m7T4JUB+6xSoTCdS1Oij6qjjt8xwVTrYSFOIbatmaH4/+NWdk0iFFWGKi84iGH6W2E
	 uafjuqyVzVpbQZ/92IAky9oAfHNo0Rj4HSeUScP8hvbgUhUJYbxmRI2m8x7rX7IBC2
	 cNW0ejA9IBTG+cgOj3ci7Vl+3B+UZvJUeoAxksYOKjCh1ZtJorKUWvqEuKVBn4Wfqj
	 pqKbYXrGdBRmzKM09Jtbr42dlcCnOkUNZQRj66HGQB9f7LOk8xhIaU9rS+LkGFExML
	 GtZw+xee89M3A==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>
In-Reply-To: <20260903170357.1711462-1-vkoul@kernel.org>
References: <20260903170357.1711462-1-vkoul@kernel.org>
Subject: Re: [PATCH] dmaengine: zynqmp_dma: drop redundant label
Message-Id: <178878937011.1980938.3197181050256177029.b4-ty@kernel.org>
Date: Mon, 07 Sep 2026 19:26:10 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Thu, 03 Sep 2026 22:33:57 +0530, Vinod Koul wrote:
> Commit 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
> dropped the use of err_disable_pm label causing warning:
> 
> drivers/dma/xilinx/zynqmp_dma.c: In function ‘zynqmp_dma_probe’:
> drivers/dma/xilinx/zynqmp_dma.c:1171:1: error: label ‘err_disable_pm’ defined but not used [-Werror=unused-label]
>  1171 | err_disable_pm:
> 
> [...]

Applied, thanks!

[1/1] dmaengine: zynqmp_dma: drop redundant label
      commit: 22f293e054dfe8252cc02cf562d3e9e460f6e83f

Best regards,
-- 
~Vinod


