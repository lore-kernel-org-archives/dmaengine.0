Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1784F475D;
	Thu,  3 Sep 2026 17:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455080; cv=none; b=eRG7Awh/+dfN0ao57458EDGCJEHe7UeVmWecJGgY5dybFFYBnI1rVDzzDc4mcd/f+x6qKEgN3ijJ5cWpEBNvB8PkZX1ZP3mW78SYoaSr+xRA/UhtS2MIpDxcRki8mQ4+iBbWsKa44ic6LFxZr80SzqNNSf84pqJWReQ2co9UUOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455080; c=relaxed/simple;
	bh=MfHeeeoKrS/KB1o9abSpjm7+fYph1lRRsen1hbP65Eo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EO3PYU+6QymEikYbcXfhH6OAqEaEfnpHetzYB/jHVu1zGmJVwd2UsAuqk7brqqoJSlqYLA3VeHxpcykYPA3DChG/u+QwDIcXZmD3h0Zf9Tv/28o027ah78GNNwtjEEkS3BqbDhAydhB0BbMzZ9Zab9dnGhm6XtvBKkVn+s2ip30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJ2t9Cc8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJ2t9Cc8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBA81F00A3D;
	Thu,  3 Sep 2026 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455078;
	bh=OsL8COcN47dIjt+ojWT5bl43xpZgyyoBi0nMf0bCno4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MJ2t9Cc8Igi16lCvCOYOJlM6pM8aMUIB0IBoLrpDl39XLHXjMCAZVn//u3JdhCmFN
	 D6aiGSxFG1DXFN6qyRwUNJ4fUBt/pl2+rQsyeWZurKqa/HWJH7z82Zi5k7st7Edz3n
	 7Csylr2WemNYThnbfai3cybES9HNyT6NmnX0FWHUjNeXgWSNODbQ0NgtK8GTeHSmtQ
	 /5YqgM9hTwfda48Fl0oSATgicZCu/a+Zr/Od+drYKTmzbCyZpdfVh2SFExqbZSK15P
	 U3Y56mO9wc2IhCZJKAxyYJ/KPd7XrmFTARHMewtE04pK2/DM4ehKPbS5uHzqXh4xWe
	 M1hnn4eWnrqoA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de, 
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 zhongling0719@126.com
In-Reply-To: <20260727061142.44195-1-zenghongling@kylinos.cn>
References: <20260727061142.44195-1-zenghongling@kylinos.cn>
Subject: Re: [PATCH RESEND v5] dmaengine: sun6i-dma: Fix use-after-free in
 error handling paths
Message-Id: <178845507472.1711546.14595232689588667911.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:34 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 27 Jul 2026 14:11:42 +0800, Hongling Zeng wrote:
> In error handling paths, the for loop frees v_lli in the loop body,
> then accesses v_lli->v_lli_next and v_lli->p_lli_next in the
> increment expression, which is use-after-free.
> 
> Fix by refactoring the cleanup into a helper function sun6i_dma_free_desc()
> that saves both the next virtual and physical pointers before freeing the
> current node, preventing the use-after-free.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: sun6i-dma: Fix use-after-free in error handling paths
      commit: 3d2c0d555d34e661d3280f85bf01ec7ed63a8f44

Best regards,
-- 
~Vinod


