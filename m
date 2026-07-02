Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E91D32ED40;
	Thu,  2 Jul 2026 16:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008238; cv=none; b=CLRIW8BTcSi7HDqJ5dXaEolzVPu8GbIV4ppdIDpDUwsvqAG0GbVuJSUjVyt1FidyCkCHUCXmznr7RQg2M+UdY3uP3aKysh48+2DRQQcZP+cfLTPVNdhIx98dNShUlfIGAfZDyA8GdyMheYR5OUBIkWs47o4eoHH2JlbbFJa7sVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008238; c=relaxed/simple;
	bh=TTRGd55YBxxoJn0VWCUgJ0w7s3ee+vsGzkR1KScN+14=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qvXOOTBNtCRKjH66EenwbP2vW4UlTHaqaCLm5kPLohSnLqqxmBAbio450t+qdQjKv0zfo192j1YsRwcTfupfZZomHmn58Q64pihtfLCsqsOUVyv0+hnIw969MWRlrw0vFI1Gb3MlH6VAYwN1r8XBtoOjmnjwBOc1rDubFtE9DaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXs3XgtX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXs3XgtX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B2D1F00A3F;
	Thu,  2 Jul 2026 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008237;
	bh=0MUOX3nNI2DkDn5Yu6yeWqa1P77WLepR6eX/6+UgnpA=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=kXs3XgtX5sEdV6ruq2cHLrrrCSIkrCSQ6WFQTZtqhUhjmM9WhY9Adm5R4iC7NWcaG
	 lXZnl35748LY6ckYL2dLfWwq1jkXBVa353nWWba322cMTdQzvcmWhwm4VPQ0FJ95te
	 9/r6d4oEugUglrJp6CqBTet8I9QCqagSpeMvI1lPTEhCj+B4mktSnUfRXNc9FUWxke
	 SGN67dPiow9SsrwMBR6LBnsNwvRu0rMu711VJG6KS2pPklSZefwjBTAwMJYbiTdSg7
	 ZdcP8Ej1ckAANHAb2zgO4gkms/+pZkDUnhIjeNd7Rke9IJG9cfiXNk4zkV8YAJBo/x
	 TfD1M/qvXG5Kg==
From: Vinod Koul <vkoul@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
In-Reply-To: <20260617084944.705266-1-ben.dooks@codethink.co.uk>
References: <20260617084944.705266-1-ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] dmaengine: dw-axi-dmac: fix __le32 on set of
 CH_CTL_H_LLI_VALID
Message-Id: <178300823545.756665.16402434308691261648.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:33:55 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 17 Jun 2026 09:49:43 +0100, Ben Dooks wrote:
> When writing the lli->ctl_hi, this is an __le32 type so the
> value being orred should be convered to __le32 by cpu_to_le32.
> 
> Fixes 1deb96c0fa58a ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
> --
> Note, the call to axi_chan_irq_clear() is passing lli->status_lo
> through which is also an __le32 but it does not seem to be set
> anywhere. Is this also a bug?
> 
> [...]

Applied, thanks!

[1/1] dmaengine: dw-axi-dmac: fix __le32 on set of CH_CTL_H_LLI_VALID
      commit: 89aba9c39bdda8a973a6ffed7c9e93321edcfc16

Best regards,
-- 
~Vinod


