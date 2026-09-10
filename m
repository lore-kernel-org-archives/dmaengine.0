Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CB44A3D3A;
	Thu, 10 Sep 2026 14:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049216; cv=none; b=jyO6i949aV72ZrDUq59il1f7z5bdcq4ohkVCJo9/N//mnuSXyWqfFgFBFdRRQuiQzn6r3xbcg8sR0prB3VmQtfKRed3a8f1AQREIMom/kZ8YU9rwKOC/CX1qdBJQV9L1GMtRNG4VpmSX3Xp95OJ4MBiAGosaAM8LonVZFmiMHBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049216; c=relaxed/simple;
	bh=pBr2Wslr/OBvg9qHQYOJVOBcUgvKRbCd/2uvc/bLd8g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BHdLQFSzICzV/L0ZZHQ7o2Z9J5XQZHkUzy9LdvklEe4eIp4Zd5oP7ViO/41PhbdEQ5urBJ91AU4/DWOwXGTa1/IgA6ry5MFvVMDHEBGDgBlIvuE6miuhGLQ6cxnS1Y9gvNMamPqE8HIthw0SZ7fZBjGvPP8wQ2KzPq4CiYkx/18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fooDFSDC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fooDFSDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589461F00893;
	Thu, 10 Sep 2026 14:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049215;
	bh=ktQ/mCzljVKF0hvcEfd4hDNXCpVqMxkORMTuXMwuaFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fooDFSDCRbGIyectMaPvdLe4BSe0Xeb/ACL9L3ltDh7dVCBTLG+jKdQ4Y8+rvx1Ez
	 IDDgl4dfmKSNrXfQxDGAJp+d0UsNL20qagyQkzCytVD6FeYlYuBG8hZpval3Xt9PMe
	 pGjcj4kkKb5zOF6dr+UIIEpXyAdNsCF7DiHKMVWgkxCxlSksETReJVCF1fP6uos6qm
	 muxg7TaQhDjvw6wsm0KWNi+dFnVlbBGtZgx+JeQTJz31ZIHfdOXSKQyb2M3Vn2Ggsb
	 +6LF6m9+9k0J+/OpKW9l3Bw8zBiLVJ66u2XmV4YGK5OrVj9zDEYQ8iuW9uikZSw4ss
	 lNBZmWoUKoPrw==
From: Vinod Koul <vkoul@kernel.org>
To: Christian Lugnberg <christian.lugnberg@soundtrack.io>
Cc: Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
References: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
Subject: Re: [PATCH v3 0/2] dmaengine: sun6i: Fix two bugs in the DMA
 status path
Message-Id: <178904921191.109109.5746892619101559603.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:36:51 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 17 Aug 2026 15:51:21 +0200, Christian Lugnberg wrote:
> Thank you for the review, Frank.
> 
> Changes in v3:
>   - Patch 1: trim commit message to the root-cause explanation and fix
>     description, dropping the debug/reproduction part per feedback
>   - Patch 2: unchanged since v2
> 
> [...]

Applied, thanks!

[1/2] dmaengine: sun6i: fix non-atomic read of DMA position registers
      commit: c90b6973daa37f4c283342dff881ae001dea4fe6
[2/2] dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status
      commit: 9096bdc8d930147f7c39a493a859acbd3a8485d8

Best regards,
-- 
~Vinod


