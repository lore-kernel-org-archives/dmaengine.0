Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B3B4963A5
	for <dmaengine@vger.kernel.org>; Wed,  7 Oct 2026 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372482; cv=pass; b=Xqo1falEyJyViAyA8P+L08vsh1YKPe5+Jf/LO5J6FMpkdrZQqEGdb+J98O20DiaB6Q066NCHhkE+aCeDOyw4yCkLa7aQcdG3ukHIZ53CyTOlM4mgyVfua8efNvKYByCYN5PjTZTVo5bJ19UPFltYnK27u2SHVMHTbeZ0+FYhv5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372482; c=relaxed/simple;
	bh=FpzJ35zvhmqOa2+RwZnppUz698uzzC9G/FlxDAwKxyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJjdDTLyLi0i5kbCopYU1//BPp6X6KeGrOJWrF7thSGwBaenEw+Uke1y2BnRjJvJZIQSx3xia/t7TxJBc9Ydbmo6d7kthpSPWmPmlEo0Vf9nN0OfM0Mdb/Bl9iUERgzOaNcuDG245bKiP0tUzvObgcgXjVc3ntIXZr69nWyY2SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekAsJW71; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekAsJW71"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67699afea08so1805709d50.3
        for <dmaengine@vger.kernel.org>; Wed, 07 Oct 2026 04:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791372465; cv=none;
        d=google.com; s=arc-20260327;
        b=TnuauE6vI+wa8mn9RKQZuZpRoXJG1B9I5u+QWu3M7q+Zo+Jk0vlFp/ImOmdXaRZ1sG
         EtCIDJ1h7EQcBzfnZOtJ0SMQ7lDOeNnMbgFcyQFvHRGrschCiB0ROJyvK3YpOTsr2Teu
         mQd55LpNZX30S0a27BP4P0FWaiFXQbcJP5HBlV3Fy/asaegKDOzw3bII6BVqnqdC7fsK
         ejI6Kn+NbInMiCxP/ZOV45c5WXa6wjck1Qbj9XVLgZmbGl8O75CLmDcF9tvGc6/CHuws
         ZozVJNeE3gsA90WDGrCvmq8UfsXtj2dyhHMymr73yCLej7JymF2QPNsRusKRJcK/mBcn
         K5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        fh=6eaVA7ftNr/2sfWSwHdRi+Xn0iAs5Io6ZaUGodpiyqM=;
        b=UoAoQpByuT4tt4NLi76peBS9KVAVRYeu+CH2raGqdlpRnCttqH+IDv15zqZy+xbCY6
         FSImxD4FiDAZ6V/OmWwLnV5fYTzEc+Il77JO0ahm2eXismLZlWOrw1VhZ8/Ko/quyj6H
         dKCjRkc3PO8XwDjFvf+/d65BchwDLz1wAm9UQ9re4nER/CakcI+Hh5IFrhZcxuSyW4sc
         1z5pprdz1emLIDBluoe3BvASgxMtB4gBXvfW5vFPaqCHYQ0FQ+JYlMlrxM/xHWiw/hld
         Iit2P5M+3IhfqbeF5Nwe2PQy7M2E9OoEc0qKEvcPYtfJavyp9sVbpLA15XTC6pXHVVKo
         mqnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791372465; x=1791977265; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        b=ekAsJW71M9T9SI/egh4sshHwR7cszL3UPcuQljDyCjPu7KzXjwEDvTaRBqszr9jTbp
         o16EnFaWwL7HV3TI2cvXq7So3tpp9Vblj+zpY5YaunZJfBSjceaGGNndi6DY/10ernu6
         Cf0dY6kF02KBthwTwnnx2Cxldp+xxDfh/XYHptxyic7YhVr0tJyT1chQXp02h8jCwZEA
         j7g+h5Gu/jKROvgVOOqWTNcmakOKkgi9JkFpsY3vvlVfmNklHhnI5LApP4O6CsxEgxCK
         wk3Fpx9r2fZhJdCW3ZTZfPt9YpU4hlZ6lRJTswEUl0l79xfQdsIYIOxHiK/+3z4o3mn2
         CSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372465; x=1791977265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pavyWN5UuE9jlfBpdpJeca0fIeVjQP6tBMNr3yh5OZo=;
        b=070zGBY66EgZQSQmo9NcXFt2MP+o2x03yW3co/Vep1hVQchB1V5XRMX/DZCPxXvWMM
         bOAzgsQF7ZROyixrwT7hd5snANtE5NIDyUSOC/NYoICjbeh18ryvo37shtWHVPbU+JpE
         zymb78pGzPc25WokN0Fw+LxuhzEB3e20clWniTK3g8HF8VGVH6GIRNCpLN3eMXzR5qLX
         SFRCHvXU/CbZErRje90dOPqkJHFBwuguwCzyzIJPJ530CmHoOnb4KqEgZHEz1XbLotqY
         hblxo1DRtQ30i8YTesmtzN9ky9zxwM0PPWmHn7FCWlqHZaGv1WTWmnme65f7Ylg9eM2i
         4ZzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHdjX9hOjYVrqEaygOtgihzMzJxDhxYvvBIOT0AgQpVui1QoxeYHWZAVsEl/P37XuuLSmwrOUjdXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIcCxLld+8lEVVTGM9PxEE3NB3qRSKJiP7eDuMj5X9OcMEaPZL
	oapsP5tb+/I2YMIfvZgNhnuVjrLh/186SDMEXYQJImEV+Hz7ZBDFp6IOxgHBxnjJKBGmjDESsjX
	QuN4psXlJt/djPWfMYYwdjS8dZtykJpQ=
X-Gm-Gg: AYBFou3LWGRruAdYaoItoo6nx8T8uD6yHqmM3Q155e44RJaSB2wpyVuGyTCKXoU33Hn
	JI12oMEbuK48dqnerbDYXHLmkoEKRcJP1AVBkdtPfHlQKLlSShBWtSholuNhzn67FayhVJHOC9V
	wp5qg771FUXRVH4ygj8zzqQQR04U9geJYeYsViK+/XF0fqLKFCTg8QHlxVZwoNmspm3XkHLEExn
	+z42An9O1pdujHgOQvSWBsGiH+uLuNB1seAI91f+3AAcrDRlTwpinS1R+kxQVYVW0ISkLb5hf/K
	ObyWo5eAfY+A8QYKbS5fZo692RbjxPuOwI/TNy/U5smSrC/Ds0uCDC2Y5N92tY/R/RU=
X-Received: by 2002:a05:690e:1182:b0:675:6d8c:f445 with SMTP id
 956f58d0204a3-6790a0b3142mr964922d50.10.1791372465276; Wed, 07 Oct 2026
 04:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808112043.2781244-1-lgs201920130244@gmail.com> <ar1yiPC1pxx8H974@lizhi-Precision-Tower-5810>
In-Reply-To: <ar1yiPC1pxx8H974@lizhi-Precision-Tower-5810>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 7 Oct 2026 19:27:34 +0800
X-Gm-Features: AclHuK9xkPJNTgSq7-x7dqK0gz-t6G-LeWcqzQTZVQ2BJAwWf9PL48vGNZtximY
Message-ID: <CANUHTR_w4cOAOoYDCDS8bwzPEuYgWp1KjZztgLx-4P1kkhwjiA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on
 probe failure
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

Thanks for the review.

On Thu, 1 Oct 2026 at 04:35, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Sat, Aug 08, 2026 at 07:20:43PM +0800, Guangshuo Li wrote:
> > hidma_mgmt_probe() calls pm_runtime_use_autosuspend(), but its failure
> > path does not call the matching pm_runtime_dont_use_autosuspend()
> > before disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during cleanup, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Add the missing pm_runtime_dont_use_autosuspend() call to the probe
> > failure path before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
>
> Your descripption doesn't match your patch. You change change pm_runtime_enable()
> to devm_pm_runtime_enable()
>
> Frank
>
> >
> > Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/dma/qcom/hidma_mgmt.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
> > index 4805ce390ffa..470c88f36d25 100644
> > --- a/drivers/dma/qcom/hidma_mgmt.c
> > +++ b/drivers/dma/qcom/hidma_mgmt.c
> > @@ -168,7 +168,11 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
> >       pm_runtime_set_autosuspend_delay(&pdev->dev, HIDMA_AUTOSUSPEND_TIMEOUT);
> >       pm_runtime_use_autosuspend(&pdev->dev);
> >       pm_runtime_set_active(&pdev->dev);
> > -     pm_runtime_enable(&pdev->dev);
> > +
> > +     rc = devm_pm_runtime_enable(&pdev->dev);
> > +     if (rc)
> > +             return rc;
> > +
> >       pm_runtime_get_sync(&pdev->dev);
> >
> >       virtaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> > @@ -310,7 +314,6 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
> >       return 0;
> >  out:
> >       pm_runtime_put_sync_suspend(&pdev->dev);
> > -     pm_runtime_disable(&pdev->dev);
> >       return rc;
> >  }
> >
> > --
> > 2.43.0
> >

You are right, the description of the patch does not match the actual
change. This was my mistake.

The patch tried to address the missing autosuspend cleanup, but
instead of adding the explicit pm_runtime_dont_use_autosuspend() call
in the error path, it switched to devm_pm_runtime_enable(). This made
the implementation and the commit message inconsistent.

I will prepare and send a v2 patch with the fix matching the description.

Thanks again for catching this.

Best regards,
Guangshuo
