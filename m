Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5AB4C1503;
	Tue, 15 Sep 2026 17:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493801; cv=none; b=DH593OVkaY3V4qMghWt1LiWCQ7IH3vrZdeE4/lM6VdAIXCVIWU+PejBKosIHonv4pvaepU8BKoD8pOsYNbC1y0iJr0a9p/VKmjSKkPVO2kaEMhGN6dPJnl5ROduOrP7AInORHvEcPb5da3uzfKn73cZB7ueJGN+Ug+C7sFNYZDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493801; c=relaxed/simple;
	bh=1CkzPqn1ps+w01PRqnnGn8jjxC47HPYift5RqKqo91U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JQXyq5C/S+arn6tlzunXrD2N+8MhYSx5hlVYtNN0NtK1wx1kwCFkfAlKHkBwYBYIXt421v+jJ9Jiq41uwTRrSQDvPv/GVrLL1QUBjzye+1q0lzLSPClgA3Xr2p+dC30+TYuSoDQqqu5Cf+OtjjPIsHa4PLkzbXnVm0ixUpFdf3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3aNArZz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3aNArZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4DC1F000FF;
	Tue, 15 Sep 2026 17:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493799;
	bh=eU+QyDuRh8rn3c7grMKH5arPf7g3bSGEarn06XP+mVs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Z3aNArZzqdTtvCK/RTJ427HuAB1eIEq2M1RjXoTT0sMvZhoeGiFGAcm1YLR6h4lUG
	 W/sIXfqynspCqzH1sQ9JtVcPK4OgxHQUBWdwfKFKh5OWTNu6d3Ao87IjkzY8q9b/YN
	 nU7HgD4lcQfe6MAqLLXsBIgCb48N8nzcYFS3c8d82oTko9pFHsjsnAv70ESvCVckgQ
	 77nRRT/3iZJQUZKSSV70MfEg7OOLgS+k8t92G5jvsy748MK0QjbsbbpHWEGO0InYnA
	 A8x0kFW04Wa5HVbFbC0GgVNff0l9AKl9W1oGThDiPemx9xVd4GWd/8YzKkeZKleVMk
	 OL3Lx+4Qvzz4g==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260913194804.39939-1-rosenp@gmail.com>
References: <20260913194804.39939-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] dmaengine: bestcomm: make gen_bd init helpers static
Message-Id: <178949379734.248239.352418063118190567.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:37 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 13 Sep 2026 12:48:04 -0700, Rosen Penev wrote:
> bcom_gen_bd_rx_init() and bcom_gen_bd_tx_init() are only called from
> the PSC wrapper functions in gen_bd.c, so make them static, drop
> their now-unneeded exports, and remove the corresponding header
> declarations.
> 
> These had use before commit 7d3ee229ea51
> ("powerpc: Drop MPC5200 LocalPlus bus FIFO driver")
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bestcomm: make gen_bd init helpers static
      commit: 1ff9bed1b5547259f67e58b03a83eda934d78735

Best regards,
-- 
~Vinod


