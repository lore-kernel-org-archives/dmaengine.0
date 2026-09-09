Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF35D538D8C;
	Wed,  9 Sep 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956914; cv=none; b=Mfyj2EYUGcR2is6QQJ8VEG3RnAUsJWAhCvvlgZJ8C0hvvW7pTFg9IuNGoye/zklMqme5hv9dmcTAzO+yCx9Qv8VvVklIkb8Up5HzCnu0s2KH/N1I92g3dDLrKOnv3sAFey3o3jBrX02Ewuu20FdQnnakUQY9o5ktTldczQfRaAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956914; c=relaxed/simple;
	bh=u89WgkOV6GJMO+g33YGQkj0kJYWALXHPlR+pyZMfmIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkXjRBsrL0g53ehb4akkezbRNGNbxJ8kvV8aQzxa+mUvX1q2s7cG+DjiFryCmYmVfnf1qQHa1VMdTBQy9saATpc924Q2Oxd0kodvFO087n1ZuGXDQ/1fbeNso+l8ppYEcArO7QKPCB7e+mwAb/LfQyTTkqJLYJYm3gK1GjrZasU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZQpzqjs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZQpzqjs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921901F00A3D;
	Wed,  9 Sep 2026 12:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788956913;
	bh=P2mgW5oh/2NN5YxPuT/chO8eYQtXNgvokn896JDpkEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SZQpzqjsbo7zDUYrnSKVDeHNcVXb/hEdX34WWKIXJdUWeQrALljvm3zahJewe/DOp
	 brHmV/mI6e9NBNqrZeCrgkir9HyNYMamQi4Okf5WN3gDBH1MnYttSxBIDuOswLGwjJ
	 11WHn2ZlP7whh82TXoBH23dGobXohtWsLO83a6PRrfe0eiUqMVIb3gaXxA/t+kcQss
	 3ZhsuvTPJDY0VH9HrjfvUTyTgJy/k2K+1CTMM+ucediFRs6+Y5FocEW+iJcg090SV/
	 vLF3eHSmGWLK4+eMESWvlFbbgytwjKBfOx5XeTIqOUSvG6iarrKNQeLGrIOHbk/BLi
	 na2NLwTcpFZew==
Date: Wed, 9 Sep 2026 17:58:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	phone-devel@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH v2 00/13] dmaengine: ste_dma40: Fix probe and allocation
 bugs
Message-ID: <aqFQ7Z-4Vcsu8z8w@parshuram>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
 <CAD++jLnPDc-v5iuy-zaTrmuxFKU2ehr0ZS65BJyR0x8zW5BWNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnPDc-v5iuy-zaTrmuxFKU2ehr0ZS65BJyR0x8zW5BWNw@mail.gmail.com>

On 24-08-26, 11:14, Linus Walleij wrote:
> Regarding this patch set,
> 
> On Thu, Aug 20, 2026 at 3:15 PM Linus Walleij <linusw@kernel.org> wrote:
> 
> > This series fixes thirteen pre-existing DMA40 bugs found while reviewing the
> > Ux500 LCLA SRAM power-domain conversion.
> 
> This whole exercise which is admittedly a bit of an experient
> remind me of an EMACS macro named "psychoanalyze-pinhead"
> where a dumb random quote generator is fed to an as dumb
> Eliza-type psychologist parrot "AI" program.
> 
> I am basically pitting Gemini against Codex here, where Gemini
> finding more and more fringe issues and Codex fixing them
> and then introducing new bugs and Gemini discovering more
> bugs ad nauseam, bugs being more and more fringe and
> weird as time passes.
> 
> I wonder what to do with this, the driver was *already* working
> fine, all I did was introduce power domains...
> 
> Possibly I will take a final sweep over the patches, fix issues
> *in* the patches, ignore any "new discoveries" then call it a day.

We are in brave new world right!

So, I would not add any new regressions. AI finding old issues can be
fixed at your leisure... I am going by that guidance

-- 
~Vinod
