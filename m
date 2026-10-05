Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0A0488755;
	Mon,  5 Oct 2026 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207640; cv=none; b=MCY1ptadMGR4DuEeLAt1WvW3ob0/F7GuzJUhpO26SsVgBGixMp256xpO6cFSWbI5mu6ypql5DnIbT9nZAsFNblp2c2cos1iZgZTEXPAyDGUlhJ8yu08GKZiNzL6fYxsdqgKfvShTktUs9IgA+/h57+PYuWB0T6AtbCDr1KPRoaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207640; c=relaxed/simple;
	bh=aVMT+TlFk3tHAaSH75xyt5q3uMFWyWh48p1Tp55Leu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGEhQ1jkrddz80DsezEd1JWvnPEVYfZJRBGc9f+f0fV8J+ZN2UMrFsIOlxw8z9MNJnH6ib1xc34iqpa4wUTsCmcgmh26rWpjTsuF0/b8/TvAoGMB5f61KI33KiE+g3OspYcMHDyZleII5Rb5NOXGj6B4LFO7eFcQB+Np/TlYKDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxthRWqB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxthRWqB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE9A1F000FF;
	Mon,  5 Oct 2026 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791207639;
	bh=xcVeQf+7BvvJau/SIVYSD0F0OxAJkDKz3X1xVomNTxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YxthRWqBIZWtFN7pZzyzeejRM1DF0EJzUmIMI1CLOiA42FQ59PtA9aAk4FQPpt4yg
	 01dyIIaItqlAtjjinAWBg9y2RWoME/sQtWu0tHJmx2HlP4dCPwYS+OuLmyeErTx+9Z
	 ecFyYsgt86Ue+R3vIouq5kc/M7CZtHhZBo7aH0hzDfVRXLa9YrMv1e8A9fB0l5hB5U
	 a0U/DUIXHCOPlfKei45Bj445bWSChytE43RsGLyPr0iLVDlYL+vxlK8WD/DtbsOjQs
	 P+kC8Hf+bhh09jb8EcpYEYpIrDIecFld2jbkiK7wYhM1alYphnUtAaP3qw257kimg3
	 N5Jd1xKzWf6MA==
Date: Mon, 5 Oct 2026 15:40:36 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Julian Braha <julianbraha@gmail.com>, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	Frank.Li@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	kernel-janitors@vger.kernel.org, linusw@kernel.org, kees@kernel.org,
	colin.i.king@gmail.com, rosenp@gmail.com, joao@joaoff.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v3] powerpc: remove dead 440SP code
Message-ID: <asOo1HzrYIysrWF_@parshuram>
References: <20260901152341.1219343-1-julianbraha@gmail.com>
 <ar7J3nl2pNW-B7AO@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar7J3nl2pNW-B7AO@lizhi-Precision-Tower-5810>

On 01-10-26, 17:00, Frank Li wrote:
> On Tue, Sep 01, 2026 at 04:23:41PM +0100, Julian Braha wrote:
> > The 440SP config option can never be enabled, making all references to it
> > dead code.
> >
> > The only board using CONFIG_440SP was IBM LUAN, which was commented out by
> > commit f65573314e4e ("[POWERPC] Re-organize Kconfig code for 4xx in
> > arch/powerpc") then removed by commit ff5f483f3091 ("powerpc: 4xx: remove
> > commented out Kconfig entries").
> >
> > Let's remove support for 440SP, since nobody can be using it anyway.
> >
> > This dead code was found by kconfirm, a static analysis tool for Kconfig.

> >
> > Signed-off-by: Julian Braha <julianbraha@gmail.com>
> > ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> > Changes since v2:
> > - cleaned up preprocessor condition
> >
> > Link to v2:
> > https://lore.kernel.org/all/20260901150645.1199097-1-julianbraha@gmail.com/
> >
> > Changes since v1:
> > - added historic details to description
> >
> > Link to v1:
> > https://lore.kernel.org/all/20260816125615.985387-1-julianbraha@gmail.com/
> > ---
> >  arch/powerpc/boot/cuboot-katmai.c   |  2 +-
> >  arch/powerpc/include/asm/async_tx.h |  2 +-
> >  arch/powerpc/include/asm/dcr-regs.h | 10 +++++-----
> >  arch/powerpc/kernel/cpu_specs_44x.h | 12 ------------
> >  arch/powerpc/platforms/44x/Kconfig  |  3 ---
> >  drivers/dma/Kconfig                 |  2 +-
> >  drivers/dma/ppc4xx/adma.c           |  9 ---------
> >  drivers/dma/ppc4xx/adma.h           |  2 +-
> >  drivers/dma/ppc4xx/dma.h            |  9 ---------

Can you send dmaengine only parts please.. or if this goes thru ppc
tree:

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
