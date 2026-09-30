Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370D24D5994
	for <dmaengine@vger.kernel.org>; Wed, 30 Sep 2026 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771803; cv=pass; b=lUN+X1vYSinAoW0mjCFmaZ8uEDBRL/Aicyv7kbsI2Q8/pMk/RrSKasYnDsu+ACWm/rNz3lvy/y4uJ5yUrTCuPVTr+1SEZByeW4eAOBlHjYWXenxro39eP5j4BSkgRxhV9cCW6GNFbG2TomYyBrvX11wQ3zkL6CKNfoBxduNJ+kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771803; c=relaxed/simple;
	bh=RZzbWSIjgew6wFLJXJB540VLEgS01esjSjMrQti3Bdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxkGKsUeXSjkMAaDWNXM2GrQsENvX5Vuhzms1bvasCYqyMeoPQsMbW6ennLVFcK8YQi4oHu1Gh8BRc6AhSnDg8l4tXlTXM89Q8pvDRLlIXEApitpV+dIf71dZJ1Tki+U75jf0rJGjld4JlWUOFwm38HF+nIFPxIaMTWVNQs++s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFUAWwpx; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFUAWwpx"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-671563fb8beso5145915d50.3
        for <dmaengine@vger.kernel.org>; Wed, 30 Sep 2026 05:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790771798; cv=none;
        d=google.com; s=arc-20260327;
        b=m4JuJ1difnMg6Fs2SUo6g2lEkZ/FXSYBYJyrtYvJKW8pgkY6tvzqHkElyeh9syJ4r5
         aQRMGQyMlaH1rKbm/htXX03BY4w9Sh034RKo2g2Qze7XJQCypqinxtDSPjTLtIX9peGt
         Czf4eA3lG6kSCGwrtbO2MEIJ6nXY2cRplxKkX08x/uEnA7rjqd7BxKK7GMdhb8uajKXO
         dy/3TwYq14ICqO+nf5Ce3H/Dhp+slzsBnvDpRo/i8K2zvE25mIyS94YKlcfQ4VganowY
         uvnvH66rV/IthSI4C7IVDr35QAbW6js8/Py1WhAs2KSmLdngfucVG+y41+aRfYi851te
         wwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        fh=rXAdtJ0t+bkOBZEEcwo7Y+o8NDDPP046L6dI8czbgDI=;
        b=NEYkiAwBjny54Gebl27O3TjddKVkpME/64qtDEbfFGrUxIoJVdRjDuvad+wJynQx5T
         DYiviQ9I7z4m5kveoELxHWqLSums7V9UT5M/o6Bf+wtvUl1nHAgy1ImOopIl+nnBq7/j
         jES0U529AhsO6Lnzzs7NuDsvJ+F9cPXgGqyG/Yq9p/I8ZAfZYWWjnJ0+7AjM7rhcnDyy
         HX09ICcGTKV7yK6mqSwDwIvHEBaJVcBLOw+5hH0cY9mj5D4K6LWQkskDn4tWLKc+cjNY
         NUSNACYQt401u1D4zqSX+6W+kkpsJtjzrA/DpyMC3gopFtsEdeZUicWiVrYJ4epe4W/F
         KufA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790771798; x=1791376598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        b=PFUAWwpxNVvoPpL968Pb8klzGZoDvFMcmc/qjkL3jOCzDfaqtEGBir6MNK67BXFeFD
         QZpUSbUMM4sJD2OV71f602feOvoskCzQDQdVIkfmFuUcQcMOXknakedYngeHUGP1+Yz4
         Ig/+pzR2mFzdQVeW/LfCDQfyMAIzQ5Tqj8kiNiy4qjM9HIaiL8IU1JDq5wZA9Vq2trij
         cS7JjZhUOmfGCKQperMi4noQreYOqEYzGP4GJJe+WlZ8LEhRkuyTp5FIZDQ+nbt/onau
         55yTPK4B9GRMg8hpVgu2FReGBboX+593W/SW+lS0OW6/V39xZ2gfZEdo8ntqNapaSNpt
         TAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771798; x=1791376598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        b=pzbnYMbAqmFeqUsu3vybE4nAzIfY6q884wGJleP2oKxUvO3SARnB681LsZGQKHcjGq
         ZfIGF1819ilhtVm7+HNDIxUpSBWc3MkNrhRbcpUdG0fAYTLMF/R4tluBoSm2/VjDGvyT
         WiVnc0jUQD2REPOqpVAqYYgP/yZAWkyoxdqrOje91dcn5Y5yDC+f2E8F5a076pEBCN55
         xDUMAnU33653zT+hS29/LU9vRtrFn58pHyt4rpdklh1V6DiH9FnoTuj9Vu2uXXBImOHE
         4+huM6S8uuh1pqoxNyAjWIcckfTYEZNYFRapEsChY3wwhPWSR2VTFpyTLj5ie4GZ7VAd
         MudQ==
X-Gm-Message-State: AFuF++kFFuaBVBfVFQbzk/+82svTcI9ir03mPXG1PkjwFIGWkKiMzo4s
	ocUUvU1HW4OaIl62nv1f5dWLITdD6peZx9cmuj02LOpvkhZhVEweI+5Ien2yEbRc+J4u8kB17EM
	ik57OqWsdh0lshsbXtutivLvCphNPwVU=
X-Gm-Gg: AYBFou0K3Kn7N5GdqPxLzRYLnTpiV5FDJFwsTSD5OQMMwPAfsThL7wIaPslMD/cgrnp
	aBVnx+CSSQj4nij69Ye7BmwzTGPKaGAiiUVeXmhIOZ1YZ6eE7TMTmUtH4xlgvjc63vBox6GYP+6
	lj6mxO3BIxwMU95+jpoHdh24FvTLwsL8ovDM5qHqDP4q0OnohES5DMSyLfjw45VNDglMMPECat0
	lXcCbfWHzEdHtb+gFTmtouulgzm/MsDbG1zs0bxsCUHBdC0c9ABXEICpYOaR76aKBV1WkvBj59l
	4RliiKrTnEvRQpe78yrzSUsva1WwC67BVON6YSOP2azBI9HCdBVR2YFFU/4fqw4BdA==
X-Received: by 2002:a05:690e:4012:b0:674:139f:2450 with SMTP id
 956f58d0204a3-67683415fd7mr591950d50.29.1790771798163; Wed, 30 Sep 2026
 05:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com> <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
 <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
 <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de> <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>
 <1b56f03e-fab7-42a6-ac49-7b05a081639e@web.de>
In-Reply-To: <1b56f03e-fab7-42a6-ac49-7b05a081639e@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 14:36:25 +0200
X-Gm-Features: AclHuK8YPOdQOastRi1a18WPN6tYPPB7dTTORvevLwrAoFcXLuyzCP_Sv7ilYlk
Message-ID: <CAGp+u1YXDCBUWJGvu7FHO-+m1K47hX0gBo=T1Vumv2GNJoBhkA@mail.gmail.com>
Subject: Re: [v3] dmaengine: tegra186-gpc-dma: Read channel state under the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:21=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >> How does this feedback fit to other known guidance?
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/researcher-guidelines.rst?h=3Dv7.3-rc5#n5
> >
> > I can update more information about the static analyzer (i.e., it is
> > experimental and its reported log) in the patch.
> > I believe this aligns with the known guidance,
>
> Partly.
>
> How many contributors would be involved in the mentioned software researc=
h so far?
>

Currently, I am the only one contributing to the source code of the
analyzer. My co-workers
provide research-oriented discussions but not bug reviews/implementation.
Regarding this, how would it be reflected in the patch?

>
> >                                                but I cannot provide
> > the source code links.
>
> Do you try to follow scientific development methods?
>
> Will publishing requirements grow accordingly?
>

Yes. The source code will be made public once the research work gets publis=
hed.

>
> >>>>> Were any more of your contributions supported by advanced source co=
de analysis tools?
> >>>
> >>> If you meant AI tools, then at this stage, no. For this patch, I have
> >>> used AI tools to help phrase
> >>> the patch better, but I did not use them for code analysis.
> >> Will this information trigger further collateral evolution?
> >
> > The collateral evolution will only affect the experimental analyzer.
> > It does not affect the submitted patch.
> Will opportunities be taken better into account for improved change descr=
iptions?
>

May I kindly ask what opportunities you are referring to? If you meant
that whether
future reports generated potentially with the help of AI tools will
credit AI tools, then
yes.

Sincerely,
Ginger
