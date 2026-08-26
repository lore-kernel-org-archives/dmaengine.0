Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC9C3B6C1D
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731908; cv=pass; b=i4A18dBQZY/bmEGP5gCJlig/GSPHNoXy5ZnOY9Mhvf4gVx0t3rRJTsv9mPR3muaZEUI1W7bHmlGJKGxcb5IBKNAcg3xMTbzrlVAOnE3gfKkBI4Ve5imziCpnVaWULl305fR7NHenEBkyg3P/1OeDYPNxI29pfvCX6fHNy4UVx+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731908; c=relaxed/simple;
	bh=aNXvnIajDX/7w3x9F5uELFST7rm/QC00IWx5n1LjaBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VeEFYf4bniQnkcXZJvGvtNWCUUXXd4Vbq8pzNUOg7UeoKzzUTmrVih+esITe7HNpX0qJL/qE68hKFH+3PYDDB9WTHQZN3soIuJCcH1HXX5gFivYPNy1riOevkeqdj+9S+LPKO9NBTgmlt7X1GmoAwkOI+JNbpnvYEND5cLK5oUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nG8HDe6H; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nG8HDe6H"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66c82b32121so1120496d50.1
        for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 01:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731906; cv=none;
        d=google.com; s=arc-20260327;
        b=B62++dUxY+d0eP+4SBnifJC8g1EWy+fPOvzd7YVxO2rtCrSYAQCYcTbzZbczJpcZ/E
         QUIzlUuDmHP3WW9h360Pz0BonZkOF5flHFNt5+2lwDzEk+4uaPBnFIjNXFV9ui7Bp4p/
         47timVhPkO8ON0ISxfiS4bvIc+/wdNVLv9+EpIuGNvAuV2zmWg6P9mQhNzOHWShPzTOp
         8tcMd7mzs1VItgDkdwI1J6J+muZFGRMndGNnFEjSyaT2y1CWZ8xTfwJ4dcWLqbPC7iwO
         Jj+H8KHhvFXzvUgbKomMhlxRBHcnTARF4L4R5jyzAMVv8WMcdjF79j4JbhaQGOmZ+eRw
         /9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aNXvnIajDX/7w3x9F5uELFST7rm/QC00IWx5n1LjaBY=;
        fh=OzhWogebtETXJMfq0eXzs80O/vmW+R3e3Szrg0458/s=;
        b=is9etUYJLnU8x4+G14qSPxcCO8bnyzdwkkGFgfce4UKE+Q+/0c2P3wFJn1B8PB7rOo
         O6NfXIrD/+XX5z9RMlejWZb1K400ocVDDGQdqsXnZTl2jCg2j8fPaWxo6IYCJf9bIU5r
         cKExyeplPV+TlqaUI+nBFthQ4Awy9RQHruSHm+nuUoJ+H1XnkgKoSZXHxevCxPiUHJn4
         lmiMSKOWEmOr0RvqdzbXKSJgTFPWKNkgHZYia/Ia2AcnowcLmVjky5H8NYXyhTPBPao5
         T58fCgv9UCrWAw70iPS2FH0Y17S7bvKuT5+PJYshzh36TBQvWDoTEYv0haC2Hfn1rUpV
         OAGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731906; x=1788336706; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNXvnIajDX/7w3x9F5uELFST7rm/QC00IWx5n1LjaBY=;
        b=nG8HDe6H7yQKf+Z7gSfhzhb72HSTQS5eyrn0cx+Kjw4xszZu9MNITo89LRuioKnoU8
         OrG9kKBey0viKyvAqgK9B68SGFQawGC6dbeZMdYQf3AOn4dlzBd6nfFiv2EPFq4k9le7
         Iu6ImBrCW6XZSN/GAWnnopAj1hYR4MMTlpjIg0b82zB1jn3mvICHEZiOxoheGoMWO/C7
         lDbXXqDsNh7X7Z11O0hXvIK7BJvMx9BvwlU2IfDV9+RkX/RbYzwba9c6U9hdNGkPvDn6
         Mp5uQc4P17T9/nsT1P1CcdT75hmzH9NqFOSsvfLeScM303FMoIpPXX/5Cs0QgODij2cn
         VNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731906; x=1788336706;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aNXvnIajDX/7w3x9F5uELFST7rm/QC00IWx5n1LjaBY=;
        b=jafVR+en0tXcyGJfXEsCDQxPS6i1UUty6CtzBXQmUv9hY5pHJoAB3ncBHgHVIXqiZL
         zSYpTYj0TOzVBimjFvnk4/E5ecBTMGCSISFdkAVbMpEpameZIzdTXNrSjL0pUkaKrFC0
         kZsEUPcbyfVUKHCBTaFVvkjKlejc8QGPo5NcsRJRETAU3KX/hVpZgYPTiFTrZWFTyipt
         63pnyOsVSFuhcf0Mt4BnBypUh5nnmjm2ctaOLdYUhPcR7RxMysM5X+mCyZT0wjXsB8sl
         e/t2Q46UwkxhmbXSc6dumyTo5ynPRs/MPh1C4zv6RBflOwjunfvuWl2nW0z7pCO2VbgA
         ZaTA==
X-Forwarded-Encrypted: i=1; AHgh+Rpcofd1HvfkrjQnmYrJUr8myGjjqKDTqt9p4qRrDU3lHB/eLF6HYU8LKrf59P/8Pqsosj+OLgFj31U=@vger.kernel.org
X-Gm-Message-State: AFuF++mXfMDOF15OIpcqi8vN4isLowthpS49266h11suYHJ+vJ6LtQfH
	5V4J07QjAOVIEeXZnG9UVTOL4Ar//iKqGUd6dNvKii+Q5kg+w6pph6ZTwX49XD9wdnP9FHd9DM+
	aNXkPNGmYiD7u5VZ8UsTzReIu8CN2AZg=
X-Gm-Gg: AR+sD11J1kM3hmIX5dnUpjTDvIdX0wgGWb8IYIbxvp0CRcZ7yO+Mi+KuEhAkBxJS2+9
	ki5NigTvuWYm/S5J8d1WGIsVtxBRklk8/WYaNPNMAkSJ9pgutou1paxIOD+ErLlFDeWUuu2ssIJ
	nt66gjgX/x5WUa1TwZ0CBuOEVWYRHTbjwzv+fb4S+IV4uqi65FnTxVS1MUULArttzMeaaUGHu67
	9ekTJlrpT3M0zr6tvtTvktpxpFz8RasouERTBBTT5pJsWHjW1lccs0fmyPEs1hAxqFMSdc/abEq
	yG1MCivBe3eCEAEt40VUAOpVXBUmK2UARoeZBw+OIb8lBkI=
X-Received: by 2002:a05:690e:1188:b0:66d:149e:a901 with SMTP id
 956f58d0204a3-66d256c264dmr1479589d50.21.1787731905567; Wed, 26 Aug 2026
 01:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808105657.2762974-1-lgs201920130244@gmail.com> <3ae8e5d0-4677-48de-bd2a-3315f99650c2@kernel.org>
In-Reply-To: <3ae8e5d0-4677-48de-bd2a-3315f99650c2@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:11:33 +0800
X-Gm-Features: AcwNN1X38av1r3fQHAr6_E215JsX9BX5UoU7-6ID8IrKi7kZhsgC4YYykT0ACvY
Message-ID: <CANUHTR9GnWwDbPK-Hmnc8TY1Hrn5tnV81ytb=wpxogCZY9XTNw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: fix autosuspend cleanup on probe failure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Srinidh Kasagar <srinidhi.kasagar@stericsson.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Williams <djbw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:50, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 12:56, Guangshuo Li wrote:
> > d40_probe() calls pm_runtime_use_autosuspend(), but its error path does
> > not call the matching pm_runtime_dont_use_autosuspend() before
> > disabling runtime PM.
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
> >
> > Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo
