Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403CB4B128A;
	Thu,  3 Sep 2026 13:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443355; cv=none; b=BAzfSm5G1G63GDpll8wZUBvZbnFcGFSP22wFcxKY20Zv3KaP+avHoyJH8mVrle844JbWVuEfozFiAyys+rF3TJvSSkOTRGx5urif6iNw4yU6izIx1+8kogJci9D7u3ydE4+hI2Jw57ZOS89n2N3e406E5XBinVbX5qMt07vaODg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443355; c=relaxed/simple;
	bh=wxEokdc9v0sLFc7RsLtpx1iCgxpUwaBmCkzBQllaBpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/z+Up/fFrsOQORbM44bdpi0uehWAwLEssVmM8xbOXiAS+2nc8yCYiQBrt92tDY/TOkDjJ7nyZwjBOJClx62MecX8F/bns/pM/XBhMHXwzC6YqS6H7eOu9xPzA4KbJG8r8w1J3byQ9Kq8U/IJLZIiL5qFDjCeWxB/Bxrb+SnZCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHNffNQq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHNffNQq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1FB1F00A3E;
	Thu,  3 Sep 2026 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788443342;
	bh=F1nK31gnkzI9Io9R72lmpT7m6o+MBgSGh7Zu4L+/tv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FHNffNQq1KTJfGiLzUefFyL7tnyIPddwHoCIU+lExhOknLKYXOryMsssoq3mGdTqJ
	 srR6XMP36qC44KPhga9ut1uLbFdVpB0Rl/Q+cbhxXmwNlKywvMSxb9Ga1eG8uQIcKl
	 NLVeCjPLoHyK19SIqCtfRTaztN2lsN1lkxhrJ7wpgyBWuP1/qjU1NsymzULnTscKgl
	 SZu+Z2gIAI3KORkUI9gi97VqC/B6Tu4kZvmTRnBtZNfl2piobDPllAEUrq/fKko5h/
	 w02TjLAMpSFQdzd2St0lRYKCEmVGUcnOVyWHZI5UdboNONu6sgB/GlrVzkT1g50ejV
	 diQWd4hinXuDA==
Date: Thu, 3 Sep 2026 19:18:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: replace in_be32/out_be32 with
 ioread32be/iowrite32be
Message-ID: <apl6y2VM4lXC1h6I@vaman>
References: <20260718033122.2372985-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718033122.2372985-1-rosenp@gmail.com>

On 17-07-26, 20:31, Rosen Penev wrote:
> Mechanical conversion of the ppc4xx-specific accessors to the generic
> portable helpers.
> 
> As a result, enable COMPILE_TEST for extra compile coverage.

This does not apply as it conflict with patch sent before this :-(

Please rebase tomorrow and send again

-- 
~Vinod
