Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3051220D4FC
	for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499549; cv=none; b=QFzpImv7G+V8gSxhT3gR/o2KHKu4M9a4ShusKcOZ+8FHb0C7ISU/IcvWqtsNswoysPV9cp3t21Hdtk9ztJMmrxwJCfnhbcvyqh0ZibbcGI62RQ2nmV6E+TJ+nuZIpNlo1XVaT4881RaSyddkueUIn95VxlknkEDPoo6USictCKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499549; c=relaxed/simple;
	bh=pPOoNrNQvGJlF6YUpyUORlzYvCHBdytaUb4N2VAiGwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7+072rBZtIzZBPU+H60SWhT35DsF5Q1FK/VB5R/+d02uIBabX5WmO2QZJfm//9izKjbLMdrN+SMv7H2j5hf53SHRff3BgUNOhlKaKDhLhFfLq5jArol1dXULuYixZfqLKCCgneNrVo6rqaSQLgNCZdOl1Ic6LbWtEbPyhJrZLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nB/JeJCI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nB/JeJCI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA0D1F00898
	for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 08:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499547;
	bh=pPOoNrNQvGJlF6YUpyUORlzYvCHBdytaUb4N2VAiGwY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nB/JeJCI/FiozoB3PJJM6cujoL9SJ2zqzwoC18TkQmeP2hui3dFEe7ECrwzVMrJkG
	 63hDpbHJqFzVmv1RK+evB8CttZUArTx6HNblFFfXSTorH+L+/DxmlJEraZ3MWIaNvG
	 tXgmaIWGmao+QbrmveOfSWTWUHQ8Blia8/zmBrLT61+l1DJfwucPQLZdEQl5nicM7b
	 err3hDjHzQK1PdUSLDfI/ckVVQkMSkQ5UT1+FuJnWI3AQp4T08ZNQ7jAOvl0WGyhLX
	 /Bna9Ni5MPkyQb1iZaOBw22t1jJq5TOSILZ6WyuRLvEYwPP31kWdfw2yFNQEx8w0ow
	 nsJ9skKdVpkTw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so2707497e87.1
        for <dmaengine@vger.kernel.org>; Sun, 27 Sep 2026 01:59:07 -0700 (PDT)
X-Gm-Message-State: AFq9FYLBOzI0NQyRKZ6CU53d+ZFfSyo2+zvGkRmnPm8Zdw9H19DsIKPF
	LQ4KhrTKo2ZIXXjavcT5NcnQBeffH58li6lfOkNeHT7vfEmIBBN0vltopKupXDV/F9qhD2XFG6b
	VIV2ahxNJRf3MjswQ4xE0BHONhyQ4aJg=
X-Received: by 2002:ac2:51d4:0:b0:5b8:ef26:9308 with SMTP id
 2adb3069b0e04-5b8ef269320mr1404705e87.26.1790499546406; Sun, 27 Sep 2026
 01:59:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-dmaengine-fixes-v1-1-7e10da1633c1@kernel.org>
In-Reply-To: <20260918-dmaengine-fixes-v1-1-7e10da1633c1@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 10:58:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLnuV9mzAjaCu71pGUBBU8ZgW2C1S4eu+D9mp7r55EL2SA@mail.gmail.com>
X-Gm-Features: AclHuK9xxyWiYe5uVc__2P7B3n083fxU7AiulrKIJYdZMZEmP2Cun7XMtlLTVts
Message-ID: <CAD++jLnuV9mzAjaCu71pGUBBU8ZgW2C1S4eu+D9mp7r55EL2SA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: Use unique debugfs names
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi folks,

On Fri, Sep 18, 2026 at 11:15=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:

> DMA40 registers multiple dma_device instances for the same platform
> device. The DMAengine debugfs code uses dev_name(dma_dev->dev) as the
> directory name, so the second and third registrations try to create the
> same directory and print duplicate-name warnings.
>
> Keep the existing device-name directory for the first registration, but
> use a dev_id-suffixed fallback when that name already exists.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Can we apply this patch?

I think it solves a pretty straight-forward issue with the same
device adding multiple engines.

Yours,
Linus Walleij
