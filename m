Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22983EEAE2
	for <dmaengine@vger.kernel.org>; Fri, 31 Jul 2026 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497190; cv=pass; b=iRK209b18QYfLI2GSm8NMYfN4kbX7VW3AzrsDlZxjUogK2W79ZIG1tpzF35Pp7R6x2QbG7ZQZ2+qvKgfxFYx/E2irZz35smWuB79hJ/Ypfs4RaXh6nd4vrs3kpoFnlHCQAv4pxv7C09NVY7OC+x18Ozm7+G0wYtdfY4NdbiRWBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497190; c=relaxed/simple;
	bh=eTKhNSmO7gOBXcxQpbQd8UaBpN703ks8yeJ8BPCpvBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQg0pOj/SUaPerWp58KgxDXWzFP05vFKRbZbrjMgqAx62Sgr5QxW3mCHCXV0FNFINXQn0ZZSG5uqT0qvwwrx4wl72Z785LLgxWqRupJ9rnzbF09e0WnPJV+nxX/HyDM4BbgJ6f+3pDROCtNjd7nB0aNU+xWEggeB8H9h75kCfqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geYE+6fx; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geYE+6fx"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39db07589caso7781061fa.2
        for <dmaengine@vger.kernel.org>; Fri, 31 Jul 2026 04:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785497186; cv=none;
        d=google.com; s=arc-20260327;
        b=cg2loGwnjOa5aTDtL2dIsbQ1nEQKDkb61mwPxo2sZUX6+E9ZbPIz/s4ZxWRO3ggzDj
         MehGiZEH6LRBq/HZmXOHwuI8mD583IvXig/XcDy3rnd/MODVUkKuInkyi9Cs8XJ8JchL
         a9ouZQ094bvW7BynAub+GhXO5pj3aimGQi/H7Scip1C1Jr2kDnQIG1BwKbKSTz2wDLT1
         NnJueSKhDeqwb6ph5fmgmnN0qXbTEAIm9b1wi/MgKZtQJr8tSEuuE21ESl3GdB7yyK3e
         gl6fhhVSfBQwtSoND+h+04dN0xvu4nxCTYVGzAhKvsAw5FjRLm/NsBZZThcmqBshCGpL
         Vxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tx8QlJcUBeFKUO4djTB0Bjf2dRsxVemnqF1oCIfTdQU=;
        fh=u31LcifOWt+u6kYUsN8HgOYY51RJCay216xjSBjMjKk=;
        b=lhEy717b1yEhUjWvhF8dd6ghebxTPi466XEcb0v6cTietGjs2+nHxCGbfpKeXg4obZ
         3hdFt+XqHMaWM73FaEoBeEEW684aZiqC2wDL5BXKsE5C4mLV3nhBZ5AMBkm3lVkZbfTn
         vtUhjxph8E92L0OgTYivm6jIO0kQdUiAc4rUo2+gU1AynkUg2EHeOLsZgk/3H1/teWAX
         3ArmeXFLLi6VhgQBMZ7q7WoO3Vk6AZ9JsgYRu+xcp4oH0Xe1pUIXzUOzCHGbKv78+mQF
         iH30V1c5SVTSV/BPukBFZhlcUCW9s2ILtyakKwT/U+egt7IGiZtB3YXaXCiVlRwMEVlt
         EEpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497186; x=1786101986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tx8QlJcUBeFKUO4djTB0Bjf2dRsxVemnqF1oCIfTdQU=;
        b=geYE+6fxxaDpeEDhQbZMv5PLEch5EBwvDNkieXoLTq/u4X0glsEp3tXe37oNm4h1iD
         iTXaw4UnX86qCNxvuP5F0XNVPozaLMGOIfgFfs8kpy5C1LIAVnSAklTktUn9CwxENyl6
         7oh5Tmx2Iu4mr8cwKK1Ok43s4fYw/nxfi3Azgmz2dGxYao+cnMDgPQ3TQ87KDL7CrxAJ
         sO3ju6iUIsLFsyXJ9kaKluCip5VcS7VirPITXA9Gv3UX6pky+XzhRIr0IjUHyoO1q8h7
         bpFZd6y1pLN/8JbonSOQhBNmDUOGK351FnNizkJ0y79yw78wBI34SS69XiuJ8LRAOBtw
         Z0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497186; x=1786101986;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tx8QlJcUBeFKUO4djTB0Bjf2dRsxVemnqF1oCIfTdQU=;
        b=a2bCfUdna0bxhBPhxX4+2ZGCWX6bIxbEN6nJBJ5i5VA/SNHdLrHRrhosuxqRxIncUn
         zS/egQrWppbyAh9O/T7UvgzOVH6RtgqeHLsyL91SnIUyi/RTRR7hhCXTzVo4jNN5l9jI
         Efs05sEBEAfXYS6N3beXQAxtAQGJj6wFSPV20jmqQegizVB6YSMSrCTDK2eRtqhvtPXj
         S7wYHEjE+/CRiWGyJjQvUXN1gABgWiJSdWqEFZK7Cfr/ewVzRSE85UvQJ/hAXf/3Gfi9
         pvi9DOoRZXxCSaeAYGLKaWE9aPSW0t5JViFx7bf3ieMB/0O2eGuXSylE+5GkxOURuv62
         B2nw==
X-Forwarded-Encrypted: i=1; AHgh+RoQV6QzmRsu6buDpruQjB87zKXkycPEbsJt3fLuBag71YOLTMvyyhamIh+xK3QNHfPCDUB6NuZcosw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9STGvXkMtV6AmTkzQcDjfjd831o1ZTj/YGpxhbtMpvsXauEqw
	JKrrhzNxbjpgYvl/1mKa4XxQ7m1LQwSvD98y+yq/2+X7O1yTZVw4tYIoiyAi2fn8UCbqJRa1yYl
	XZOKQocNt1f01S9RZ0fi8bymKs1Q14eA=
X-Gm-Gg: AR+sD1190OfgYK3uhEWqDTLvGpLDMitbT2O8Z+AqbKPgDyPtCgsmUCDE7cKRNapq+4I
	Ss8kOp/YBajtz6lvY96iC9GiS2T24ehvnKAIhdHxrSZgIkBCTqLczNLriK+hJH7e0xWSydzNpAf
	mITVia8ucmheW/T5aCHt94nVZ29pbAdEnyLjkICS5qffvUETqGcEGUCYAo3Zp2oT5CWMwTM9d8u
	cxhL8QIiRl94VjRSFW/BnUGaxD+gBuGOjSReCbTCykKGNeGDZTp0jZpfmjIDtYRar2taWBdAHfw
	Ajf9R7hJ4JoS/P1CJxy3rswrpBIk5BytiHiRjn3+iWdjtnVqkawWhHTKf5Cf+irgmD62Z7vo971
	mv2b2umT6W1F+hjpPraqYcUBua1I2QM4=
X-Received: by 2002:a05:6512:6682:10b0:5b2:a6eb:ff2f with SMTP id
 2adb3069b0e04-5b2e1ffbdf2mr237156e87.43.1785497185537; Fri, 31 Jul 2026
 04:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com> <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Fri, 31 Jul 2026 19:25:48 +0800
X-Gm-Features: AUfX_mzeKDuWFGB9-QtB9UDZLLYc_PvBaCNo0Mab9h8W0ZtRXMgM0NnGrF6YPSQ
Message-ID: <CAJhJPsUmpie6NkrzuTK-8C4NP2FFKQMG3nY8626_C9Qjdu4M0g@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Wed, Jul 29, 2026 at 10:32=E2=80=AFPM Mahad Ibrahim
<mahad.ibrahim.dev@gmail.com> wrote:
>
> ls1x_dma_tx_status() locates the descriptor actively being processed by
> walking the LLI list and comparing the hardware reported next descriptor
> pointer against each element's next-descriptor pointer.
>
> A list_for_each_entry macro is used in the comparison phase. Which at
> the end of the loop leaves the lli pointer at the currently executing LLI=
.
> However this also subsequently runs for a non-match lli, in which it
> points at the head. This causes a type confusion bug which treats the
> head, which is a ls1x_dma_desc, as a ls1x_dma_lli object. Additionally it
> goes forwards and prints garbage via the dev_dbg.
>
> Fix the type confusion bug by only allowing matched LLI descriptor chains
> to print the current LLI and residue calculation, as failing to match
> should be treated as an unexpected condition.
>
> Found by the following Coccinelle check:
>
>   scripts/coccinelle/iterators/use_after_iter.cocci
>
>   drivers/dma/loongson/loongson1-apb-dma.c:461:6-9: ERROR: invalid
>   reference to the index variable of the iterator on line 450
>
> I did not see a bug upstream detailing this error, nor do I have the
> hardware to confirm this bug or error, all this is from a pure code
> examination.
>
> As I do not possess the hardware, I cannot test the patch. Compile tested
> only with mips64-linux-gnu-gcc.
>
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
> ---
>
> v2:
> - encapsulate residue calculation and dev_dbg inside the
>   list_for_each_entry() macro. Treat non-matching LLI as an unexpected
>   case.
>
>
>  drivers/dma/loongson/loongson1-apb-dma.c | 27 ++++++++++++++----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loong=
son/loongson1-apb-dma.c
> index 89786cbd20ab..8658d5377795 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -446,22 +446,27 @@ static enum dma_status ls1x_dma_tx_status(struct dm=
a_chan *dchan,
>
>                         /* locate the current lli */
>                         next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_NEX=
T];
> -                       list_for_each_entry(lli, &desc->lli_list, node)
> -                               if (lli->hw[LS1X_DMADESC_NEXT] =3D=3D nex=
t_phys)
> -                                       break;
> +                       list_for_each_entry(lli, &desc->lli_list, node) {
> +                               if (lli->hw[LS1X_DMADESC_NEXT] !=3D next_=
phys)
> +                                       continue;
>
> -                       dev_dbg(chan2dev(dchan), "current lli_phys=3D%pad=
",
> -                               &lli->phys);
> +                               dev_dbg(chan2dev(dchan), "current lli_phy=
s=3D%pad\n",
> +                                       &lli->phys);
>
> -                       /* count the residues */
> -                       list_for_each_entry_from(lli, &desc->lli_list, no=
de)
> -                               bytes +=3D lli->hw[LS1X_DMADESC_LENGTH] *
> -                                        chan->bus_width;
> +                               /* count the residues */
> +                               list_for_each_entry_from(lli, &desc->lli_=
list, node)
> +                                       bytes +=3D lli->hw[LS1X_DMADESC_L=
ENGTH] *
> +                                                chan->bus_width;
> +
> +                               dma_set_residue(state, bytes);
> +                               return status;
> +                       }
> +
> +                       dev_warn(chan2dev(dchan),
> +                                "unable to locate current lli.\n");
>                 }
>         }
>
> -       dma_set_residue(state, bytes);
> -
>         return status;
>  }
>
> --
> 2.54.0
>


--=20
Best regards,

Keguang Zhang
